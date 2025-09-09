# class CurrentUser::BearerLogins::Create < PrivateApi
#   include Shield::Api::CurrentUser::BearerLogins::Create

#   post "/account/bearer-logins" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, bearer_login)
#     json BearerLoginSerializer.new(
#       params,
#       bearer_login: BearerLoginQueryLoader.run(bearer_login, params),
#       token: BearerLoginCredentials.new(operation, bearer_login).to_s,
#       current_user: current_user?,
#       message: Rex.t(:"action.current_user.bearer_login.create.success")
#     )
#   end
# end
