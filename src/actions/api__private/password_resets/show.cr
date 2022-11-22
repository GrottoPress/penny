# class PasswordResets::Show < PrivateApi
#   include Shield::Api::PasswordResets::Show

#   get "/password-resets/:password_reset_id" do
#     json PasswordResetSerializer.new(password_reset: password_reset)
#   end
# end
