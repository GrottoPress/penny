Shield.configure do |settings|
  settings.bearer_login_expiry = ENV["BEARER_LOGIN_EXPIRY"]?.try do |expiry|
    Time::Span.new(seconds: expiry.to_i)
  end

  settings.email_confirmation_expiry = Time::Span.new(
    seconds: ENV["EMAIL_CONFIRMATION_EXPIRY"].to_i
  )

  settings.login_expiry = ENV["LOGIN_EXPIRY"]?.try do |expiry|
    Time::Span.new(seconds: expiry.to_i)
  end

  settings.login_idle_timeout = ENV["LOGIN_IDLE_TIMEOUT"]?.try do |timeout|
    Time::Span.new(seconds: timeout.to_i)
  end

  settings.password_min_length = ENV["PASSWORD_MIN_LENGTH"].to_i

  settings.password_require_lowercase = Bool.adapter
    .parse!(ENV["PASSWORD_REQUIRE_LOWERCASE"])

  settings.password_require_uppercase = Bool.adapter
    .parse!(ENV["PASSWORD_REQUIRE_UPPERCASE"])

  settings.password_require_number = Bool.adapter
    .parse!(ENV["PASSWORD_REQUIRE_NUMBER"])

  settings.password_require_special_char = Bool.adapter
    .parse!(ENV["PASSWORD_REQUIRE_SPECIAL_CHAR"])

  settings.password_reset_expiry = Time::Span.new(
    seconds: ENV["PASSWORD_RESET_EXPIRY"].to_i
  )
end
