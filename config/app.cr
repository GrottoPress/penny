require "./route_helper"

App.configure do |settings|
  settings.domain = URI
    .parse(Lucky::RouteHelper.settings.base_uri)
    .host.not_nil!

  settings.name = ENV["NAME"]

  settings.date_format = ENV["DATE_FORMAT"]
  settings.time_format = ENV["TIME_FORMAT"]

  settings.timezone = ENV["TIMEZONE"]?.try do |timezone|
    Time::Location.load(timezone)
  end

  settings.logo_url = ENV["LOGO_URL"]
  settings.favicon_url = ENV["FAVICON_URL"]

  settings.email_from = ENV["EMAIL_FROM"]
  settings.email_reply_to = ENV["EMAIL_REPLY_TO"]

  settings.make_first_user_admin = Bool.adapter
    .parse!(ENV["MAKE_FIRST_USER_ADMIN"])
end

App.settings.timezone.try { |location| Time::Location.local = location }
