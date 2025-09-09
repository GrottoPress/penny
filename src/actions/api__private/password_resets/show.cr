# class PasswordResets::Show < PrivateApi
#   include Shield::Api::PasswordResets::Show

#   get "/password-resets/:password_reset_id" do
#     json PasswordResetSerializer.new(
#       params,
#       password_reset: password_reset,
#       current_user: current_user?
#     )
#   end

#   getter password_reset : PasswordReset do
#     PasswordResetQueryLoader.run(previous_def, params)
#   end
# end
