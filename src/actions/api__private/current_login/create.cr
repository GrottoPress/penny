# class CurrentLogin::Create < PrivateApi
#   include Shield::Api::CurrentLogin::Create

#   post "/login" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, login)
#     json LoginSerializer.new(
#       login: LoginQueryLoader.run(login, params),
#       token: LoginCredentials.new(operation, login).to_s,
#       message: Rex.t(:"action.current_login.create.success")
#     )
#   end
# end
