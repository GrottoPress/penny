module App
  Habitat.create do
    setting email_from : String
    setting email_reply_to : String
    setting favicon_url : String
    setting keep_bearer_logins_for : Time::Span
    setting keep_email_confirmations_for : Time::Span
    setting keep_logins_for : Time::Span
    setting keep_password_resets_for : Time::Span
    setting logo_url : String
    setting name : String
    setting root_user_email : String
    setting timezone : Time::Location?
    setting url : String
  end
end
