# This class handles error responses and reporting.
#
# https://luckyframework.org/guides/http-and-routing/error-handling
class Errors::Show < Lucky::ErrorAction
  default_format :json
  disable_cookies
  dont_report [Lucky::RouteNotFoundError, Avram::RecordNotFoundError]

  def render(error : Lucky::RouteNotFoundError)
    if html?
      error_html Rex.t(:"action.error.route_not_found"), status: 404
    else
      error_json message: Rex.t(:"action.error.route_not_found"), status: 404
    end
  end

  # When the request is JSON and an InvalidOperationError is raised, show a
  # helpful error with the param that is invalid, and what was wrong with it.
  def render(error : Avram::InvalidOperationError)
    if html?
      error_html Rex.t(:"action.error.record_not_found"), status: 500
    else
      error_json errors: error.errors, status: 400
    end
  end

  # Always keep this below other 'render' methods or it may override your
  # custom 'render' methods.
  def render(error : Lucky::RenderableError)
    if html?
      error_html error.renderable_message, status: error.renderable_status
    else
      error_json message: error.renderable_message,
        status: error.renderable_status
    end
  end

  # If none of the 'render' methods return a response for the raised Exception,
  # Lucky will use this method.
  def default_render(error : Exception) : Lucky::Response
    if html?
      error_html Rex.t(:"action.error.default"), status: 500
    else
      error_json message: Rex.t(:"action.error.default"), status: 500
    end
  end

  private def error_html(message : String, status : Int)
    context.response.status_code = status

    html_with_status Errors::ShowPage,
      status,
      message: message,
      status_code: status
  end

  private def error_json(status, **named_args)
    json FailureSerializer.new(**named_args), status: status
  end

  private def report(error : Exception) : Nil
    unless LuckyEnv.production?
      return puts <<-TEXT

        === BEGIN Error ===
        #{error.inspect_with_backtrace.chomp}
        === END Error ===

        TEXT
    end

    # ServerErrorEmail.new(error, context.request).deliver_later
  end
end
