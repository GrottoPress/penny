require "./mel"

Defense.store = Store.new

Defense.blocklisted_response = ->(response : HTTP::Server::Response) do
  message = Rex.t(:"handler.request_blocked")

  response.status = HTTP::Status::FORBIDDEN
  response.content_type = "application/json"
  response.puts FailureSerializer.new(message: message).to_json
end

Defense.throttled_response = ->(response : HTTP::Server::Response) do
  message = Rex.t(:"handler.request_throttled")

  response.status = HTTP::Status::TOO_MANY_REQUESTS
  response.content_type = "application/json"
  response.puts FailureSerializer.new(message: message).to_json
end

Defense.throttle("request/ip", limit: 100, period: 5) do |request|
  next unless LuckyEnv.production?
  remote_ip(request)
end

Hash(String, Lucky::Action.class | Nil).new.tap do |actions|
  Defense.throttle("scanner/ip", limit: 5, period: 30) do |request|
    remote_ip(request).try do |ip|
      ip if find_action(request, actions).nil?
    end
  end

  Defense.throttle("login/ip", limit: 5, period: 30) do |request|
    remote_ip(request).try do |ip|
      ip if CurrentLogin::Create == find_action(request, actions)
    end
  end

  Defense.throttle("login/email", limit: 5, period: 30) do |request|
    next unless remote_ip(request)
    next unless CurrentLogin::Create == find_action(request, actions)

    Lucky::Params.new(request)
      .nested?(StartCurrentLogin.param_key)["email"]?
      .try(&.downcase.strip.presence)
  end

  Defense.throttle("password-reset/ip", limit: 5, period: 30) do |request|
    remote_ip(request).try do |ip|
      ip if PasswordResets::Create == find_action(request, actions)
    end
  end

  Defense.throttle("password-reset/email", limit: 5, period: 30) do |request|
    next unless remote_ip(request)
    next unless PasswordResets::Create == find_action(request, actions)

    Lucky::Params.new(request)
      .nested?(StartPasswordReset.param_key)["email"]?
      .try(&.downcase.strip.presence)
  end

  Defense.throttle(
    "password-reset-token/ip",
    limit: 10,
    period: 30
  ) do |request|
    remote_ip(request).try do |ip|
      ip if find_action(request, actions).in?({
        PasswordResets::Token::Show,
        PasswordResets::Update
      })
    end
  end

  Defense.throttle("email-confirmation/ip", limit: 5, period: 30) do |request|
    remote_ip(request).try do |ip|
      ip if EmailConfirmations::Create == find_action(request, actions)
    end
  end

  Defense.throttle(
    "email-confirmation/email",
    limit: 5,
    period: 30
  ) do |request|
    next unless remote_ip(request)
    next unless EmailConfirmations::Create == find_action(request, actions)

    Lucky::Params.new(request)
      .nested?(StartEmailConfirmation.param_key)["email"]?
      .try(&.downcase.strip.presence)
  end

  Defense.throttle(
    "email-confirmation-token/ip",
    limit: 5,
    period: 30
  ) do |request|
    remote_ip(request).try do |ip|
      ip if EmailConfirmations::Token::Show == find_action(request, actions)
    end
  end
end

private class Store < Defense::Store
  @client : Redis::Client

  # Reusing the redis connection pool from *Mel*
  def initialize(@client = Mel.settings.store.as(Mel::Redis).client)
  end

  def increment(unprefixed_key : String, expires_in : Int32) : Int64
    key = prefix_key(unprefixed_key)

    with_transaction do |transaction|
      transaction.incr(key)
      transaction.expire(key, expires_in)
    end.first.as(Int64)
  end

  def exists?(unprefixed_key : String) : Bool
    with_connection do |connection|
      connection.exists(prefix_key(unprefixed_key)) == 1
    end
  end

  def read(unprefixed_key : String) : Int64 | Nil
    with_connection(&.get(prefix_key unprefixed_key).try &.to_i64)
  end

  def reset
    keys = with_connection &.keys("#{prefix}:*")
    with_connection &.del(keys.map &.to_s) unless keys.empty?
  end

  private def with_transaction(&)
    with_connection &.multi { |transaction| yield transaction }
  end

  private def with_connection(&)
    @client.@pool.retry do
      @client.@pool.checkout do |connection|
        yield connection
      rescue error : IO::Error
        # Triggers a retry
        raise DB::PoolResourceLost(Redis::Connection).new(
          connection,
          cause: error
        )
      end
    end
  end
end

# There's `HTTP::Request#remote_ip` provided by Lucky, but it is empty
# if you're not using `Lucky::RemoteIpHandler`.
#
# If you're behind a trusted reverse proxy, you should probably use that
# handler so it sets the IP address for you automatically
private def remote_ip(request)
  request.remote_address.as?(Socket::IPAddress).try(&.address.presence)
end

private def find_action(request, actions)
  request_id = RequestIdHeader.new(request).get
  actions[request_id] ||= Lucky.router.find_action(request).try(&.payload)
end
