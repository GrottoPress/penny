# class CurrentUser::Logins::Destroy < PrivateApi
#   include Shield::Api::CurrentUser::Logins::Destroy

#   delete "/account/logins" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       params,
#       user: user,
#       current_user: current_user?,
#       message: Rex.t(:"action.current_user.login.destroy.success")
#     )
#   end
# end
