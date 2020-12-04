Shield.configure do |settings|
  settings.bcrypt_cost = ENV["BCRYPT_COST"].to_i

  settings.bearer_login_expiry = Time::Span.new(
    seconds: ENV["BEARER_LOGIN_EXPIRY"].to_i
  )

  settings.email_confirmation_expiry = Time::Span.new(
    seconds: ENV["EMAIL_CONFIRMATION_EXPIRY"].to_i
  )

  settings.login_expiry = Time::Span.new(seconds: ENV["LOGIN_EXPIRY"].to_i)

  settings.login_idle_timeout = Time::Span.new(
    seconds: ENV["LOGIN_IDLE_TIMEOUT"].to_i
  )

  settings.password_min_length = ENV["PASSWORD_MIN_LENGTH"].to_i

  settings.password_require_lowercase = Bool::Lucky
    .parse(ENV["PASSWORD_REQUIRE_LOWERCASE"])
    .value.not_nil!

  settings.password_require_uppercase = Bool::Lucky
    .parse(ENV["PASSWORD_REQUIRE_UPPERCASE"])
    .value.not_nil!

  settings.password_require_number = Bool::Lucky
    .parse(ENV["PASSWORD_REQUIRE_NUMBER"])
    .value.not_nil!

  settings.password_require_special_char = Bool::Lucky
    .parse(ENV["PASSWORD_REQUIRE_SPECIAL_CHAR"])
    .value.not_nil!

  settings.password_reset_expiry = Time::Span.new(
    seconds: ENV["PASSWORD_RESET_EXPIRY"].to_i
  )
end
