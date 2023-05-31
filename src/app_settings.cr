module App
  Habitat.create do
    setting date_format : String
    setting email_from : String
    setting email_reply_to : String
    setting favicon_url : String
    setting keep_bearer_logins_for : Time::Span
    setting keep_email_confirmations_for : Time::Span
    setting keep_logins_for : Time::Span
    setting keep_password_resets_for : Time::Span
    setting logo_url : String
    setting make_first_user_admin : Bool
    setting name : String
    setting time_format : String
    setting timezone : Time::Location?
    setting url : String
  end
end
