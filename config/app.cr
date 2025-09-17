App.configure do |settings|
  settings.name = ENV["NAME"]
  settings.url = ENV["URL"]

  settings.timezone = ENV["TIMEZONE"]?.try do |timezone|
    Time::Location.load(timezone)
  end

  settings.root_user_email = ENV["ROOT_USER_EMAIL"]?

  settings.logo_url = ENV["LOGO_URL"]
  settings.favicon_url = ENV["FAVICON_URL"]

  settings.email_from = ENV["EMAIL_FROM"]
  settings.email_reply_to = ENV["EMAIL_REPLY_TO"]

  settings.keep_bearer_logins_for = Time::Span.new(
    days: ENV["KEEP_BEARER_LOGINS_DAYS"].to_i
  )

  settings.keep_email_confirmations_for = Time::Span.new(
    days: ENV["KEEP_EMAIL_CONFIRMATIONS_DAYS"].to_i
  )

  settings.keep_logins_for = Time::Span.new(days: ENV["KEEP_LOGINS_DAYS"].to_i)

  settings.keep_password_resets_for = Time::Span.new(
    days: ENV["KEEP_PASSWORD_RESETS_DAYS"].to_i
  )
end

App.settings.timezone.try { |location| Time::Location.local = location }
