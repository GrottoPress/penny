# class Api::BearerLogins::Show < PublicApi
#   include Shield::Api::BearerLogins::Show

#   get "/bearer-logins/:bearer_login_id" do
#     json BearerLoginSerializer.new(
#       params,
#       bearer_login: BearerLoginQueryLoader.run(bearer_login, params),
#       current_user: current_user?
#     )
#   end
# end
