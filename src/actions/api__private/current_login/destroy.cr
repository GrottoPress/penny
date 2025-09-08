# class CurrentLogin::Destroy < PrivateApi
#   include Shield::Api::CurrentLogin::Destroy

#   delete "/login" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, login)
#     json LoginSerializer.new(
#       login: LoginQueryLoader.run(login, params),
#       message: Rex.t(:"action.current_login.destroy.success")
#     )
#   end
# end
