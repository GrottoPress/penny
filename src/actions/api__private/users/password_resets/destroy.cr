# class Users::PasswordResets::Destroy < PrivateApi
#   include Shield::Api::Users::PasswordResets::Destroy

#   delete "/users/:user_id/password-resets" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       params,
#       user: user,
#       current_user: current_user?,
#       message: Rex.t(:"action.user.password_reset.destroy.success")
#     )
#   end
# end
