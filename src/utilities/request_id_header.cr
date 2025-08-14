struct RequestIdHeader
  @@name = "X-Request-ID"

  def initialize(@headers : HTTP::Headers)
  end

  def self.new(context : HTTP::Server::Context)
    new(context.request)
  end

  def self.new(request : HTTP::Request)
    new(request.headers)
  end

  def get : String
    @headers[@@name]
  end

  def set(value : String)
    @headers[@@name] = value
  end
end
