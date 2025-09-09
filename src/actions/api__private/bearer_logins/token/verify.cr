# class BearerLogins::Token::Verify < PrivateApi
#   include Shield::Api::BearerLogins::Token::Verify

#   post "/bearer-logins/token/verify" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, bearer_login)
#     json BearerLoginSerializer.new(
#       params,
#       bearer_login: BearerLoginQueryLoader.run(bearer_login, params),
#       current_user: current_user?,
#       message: Rex.t(:"action.bearer_login.destroy.success")
#     )
#   end
# end
