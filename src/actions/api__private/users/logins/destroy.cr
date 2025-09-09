# class Users::Logins::Destroy < PrivateApi
#   include Shield::Api::Users::Logins::Destroy

#   delete "/users/:user_id/logins" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       params,
#       user: user,
#       current_user: current_user?,
#       message: Rex.t(:"action.user.login.destroy.success")
#     )
#   end
# end
