class UnslashPathHandler < BaseHandler
  def call(context : HTTP::Server::Context) : Nil
    if (path = context.request.path) != "/" && path.ends_with?("/")
      context.request.path = path.rchop("/")
      context.response.headers.add("Location", context.request.resource)
      context.response.status_code = 301
    else
      call_next(context)
    end
  end
end
