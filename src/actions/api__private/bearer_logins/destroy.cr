# class BearerLogins::Destroy < PrivateApi
#   include Shield::Api::BearerLogins::Destroy

#   delete "/bearer-logins/:bearer_login_id" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, bearer_login)
#     json BearerLoginSerializer.new(
#       bearer_login: BearerLoginQueryLoader.run(bearer_login, params),
#       message: Rex.t(:"action.bearer_login.destroy.success")
#     )
#   end
# end
