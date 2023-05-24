App.configure do |settings|
  settings.name = ENV["NAME"]
  settings.url = ENV["URL"]

  settings.domain = URI.parse(App.settings.url).host.not_nil!

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
