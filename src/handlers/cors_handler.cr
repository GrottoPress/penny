class CorsHandler < BaseHandler
  def call(context)
    set_generic_headers(context)

    if context.request.method == "OPTIONS"
      set_options_headers(context)
    else
      call_next(context)
    end
  end

  private def set_generic_headers(context)
    response = context.response

    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = allow_methods
    response.headers["Access-Control-Allow-Headers"] = allow_headers
  end

  private def set_options_headers(context)
    response = context.response

    response.status = HTTP::Status::NO_CONTENT
    response.headers["Access-Control-Max-Age"] = max_age
    response.headers["Content-Type"] = "text/plain"
    response.headers["Content-Length"] = "0"
  end

  private def allow_methods
    "GET,POST,PATCH,DELETE,OPTIONS"
  end

  private def allow_headers
    "Authorization,\
      Cache-Control,\
      Content-Type,\
      DNT,\
      If-Modified-Since,\
      Range,\
      User-Agent,\
      X-Forwarded-For,\
      X-Requested-With"
  end

  private def max_age
    "#{7.days.total_seconds.to_i}"
  end
end
