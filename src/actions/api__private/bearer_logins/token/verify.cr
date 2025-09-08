# class BearerLogins::Token::Verify < PrivateApi
#   include Shield::Api::BearerLogins::Token::Verify

#   post "/bearer-logins/token/verify" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, bearer_login)
#     json BearerLoginSerializer.new(
#       bearer_login: BearerLoginQueryLoader.run(bearer_login, params),
#       message: Rex.t(:"action.bearer_login.destroy.success")
#     )
#   end
# end
