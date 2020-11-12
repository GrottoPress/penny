class App
  Habitat.create do
    setting date_format : String
    setting domain : String
    setting email_from : String
    setting email_reply_to : String
    setting favicon_url : String
    setting logo_url : String
    setting make_first_user_admin : Bool
    setting name : String
    setting time_format : String
  end
end
