struct RequestIdHeader
  private NAME = "X-Request-ID"

  def initialize(@headers : HTTP::Headers)
  end

  def self.new(context : HTTP::Server::Context)
    new(context.request)
  end

  def self.new(request : HTTP::Request)
    new(request.headers)
  end

  def get : String
    @headers[NAME]
  end

  def set(value : String)
    @headers[NAME] = value
  end
end
