# class Logins::Destroy < PrivateApi
#   include Shield::Api::Logins::Destroy

#   delete "/logins/:login_id" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, login)
#     json LoginSerializer.new(
#       params,
#       login: LoginQueryLoader.run(login, params),
#       current_user: current_user?,
#       message: Rex.t(:"action.login.destroy.success")
#     )
#   end
# end
