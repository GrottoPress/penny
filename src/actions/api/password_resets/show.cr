# class Api::PasswordResets::Show < PublicApi
#   include Shield::Api::PasswordResets::Show

#   get "/password-resets/:password_reset_id" do
#     json PasswordResetSerializer.new(password_reset: password_reset)
#   end

#   getter password_reset : PasswordReset do
#     PasswordResetQueryLoader.run(previous_def, params)
#   end
# end
