# class Api::PasswordResets::Show < PublicApi
#   include Shield::Api::PasswordResets::Show

#   get "/password-resets/:password_reset_id" do
#     json PasswordResetSerializer.new(
#       params,
#       password_reset: password_reset,
#       current_user: current_user_or_bearer?
#     )
#   end

#   getter password_reset : PasswordReset do
#     PasswordResetQueryLoader.run(previous_def, params)
#   end
# end
