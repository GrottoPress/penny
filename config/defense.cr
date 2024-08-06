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

Defense.throttle("scanner/ip", limit: 5, period: 30) do |request|
  remote_ip(request).try do |ip|
    ip if Lucky.router.find_action(request).nil?
  end
end

Defense.throttle("login/ip", limit: 5, period: 30) do |request|
  remote_ip(request).try do |ip|
    action = Lucky.router.find_action(request).try(&.payload)
    ip if CurrentLogin::Create == action
  end
end

Defense.throttle("login/email", limit: 5, period: 30) do |request|
  next unless remote_ip(request)

  action = Lucky.router.find_action(request).try(&.payload)
  next unless CurrentLogin::Create == action

  Lucky::Params.new(request)
    .nested?(StartCurrentLogin.param_key)["email"]?
    .try(&.downcase.strip.presence)
end

Defense.throttle("password-reset/ip", limit: 5, period: 30) do |request|
  remote_ip(request).try do |ip|
    action = Lucky.router.find_action(request).try(&.payload)
    ip if PasswordResets::Create == action
  end
end

Defense.throttle("password-reset/email", limit: 5, period: 30) do |request|
  next unless remote_ip(request)

  action = Lucky.router.find_action(request).try(&.payload)
  next unless PasswordResets::Create == action

  Lucky::Params.new(request)
    .nested?(StartPasswordReset.param_key)["email"]?
    .try(&.downcase.strip.presence)
end

Defense.throttle("password-reset-token/ip", limit: 10, period: 30) do |request|
  remote_ip(request).try do |ip|
    action = Lucky.router.find_action(request).try(&.payload)
    ip if action.in?({PasswordResets::Token::Show, PasswordResets::Update})
  end
end

Defense.throttle("email-confirmation/ip", limit: 5, period: 30) do |request|
  remote_ip(request).try do |ip|
    action = Lucky.router.find_action(request).try(&.payload)
    ip if EmailConfirmations::Create == action
  end
end

Defense.throttle("email-confirmation/email", limit: 5, period: 30) do |request|
  next unless remote_ip(request)

  action = Lucky.router.find_action(request).try(&.payload)
  next unless EmailConfirmations::Create == action

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
    action = Lucky.router.find_action(request).try(&.payload)
    ip if EmailConfirmations::Token::Show == action
  end
end

private class Store < Defense::RedisStore
  # Reusing the redis connection pool from *Mel*
  def initialize(@redis = Mel.settings.store.as(Mel::Redis).client)
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
