# class Users::BearerLogins::Destroy < PrivateApi
#   include Shield::Api::Users::BearerLogins::Destroy

#   delete "/users/:user_id/bearer-logins" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       params,
#       user: user,
#       current_user: current_user?,
#       message: Rex.t(:"action.user.bearer_login.destroy.success")
#     )
#   end
# end
