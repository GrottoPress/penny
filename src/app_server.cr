class AppServer < Lucky::BaseAppServer
  # Learn about middleware with HTTP::Handlers:
  # https://luckyframework.org/guides/http-and-routing/http-handlers
  def middleware : Array(HTTP::Handler)
    [
      Lucky::RequestIdHandler.new,
      Lucky::ForceSSLHandler.new,
      Lucky::HttpMethodOverrideHandler.new,
      Lucky::LogHandler.new,
      Lucky::ErrorHandler.new(action: Errors::Show),
      Unslash::Handler.new(308, safe: false),
      Lucky::RouteHandler.new,
      Lucky::StaticCompressionHandler.new(
        "./public",
        file_ext: "gz",
        content_encoding: "gzip"
      ),
      Lucky::StaticFileHandler.new("./public", false),
      Lucky::RouteNotFoundHandler.new,
    ] of HTTP::Handler
  end
end
