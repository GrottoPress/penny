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
    request, response = context.request, context.response

    response.headers["Access-Control-Allow-Origin"] = allow_origin(request)
    response.headers.add("Vary", "Origin")
  end

  private def set_options_headers(context)
    request, response = context.request, context.response

    response.status = HTTP::Status::NO_CONTENT
    response.headers["Access-Control-Allow-Methods"] = allow_methods
    response.headers["Access-Control-Allow-Headers"] = allow_headers(request)
    response.headers["Access-Control-Max-Age"] = max_age
    response.headers["Content-Type"] = "text/plain"
    response.headers["Content-Length"] = "0"
  end

  private def allow_methods
    {"DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST"}.join(", ")
  end

  private def allow_headers(request)
    request.headers["Access-Control-Request-Headers"]? || ""
  end

  private def max_age
    "#{1.hour.total_seconds.to_i}"
  end

  private def allow_origin(request)
    "*"

    # You may use this, instead, for API backends
    # origin = request.headers["Origin"]?
    # App.settings.frontend_url == origin ? origin.to_s : ""
  end
end
