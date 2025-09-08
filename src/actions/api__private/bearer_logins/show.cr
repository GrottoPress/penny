# class BearerLogins::Show < PrivateApi
#   include Shield::Api::BearerLogins::Show

#   get "/bearer-logins/:bearer_login_id" do
#     json BearerLoginSerializer.new(bearer_login: bearer_login)
#   end

#   getter bearer_login : BearerLogin do
#     BearerLoginQueryLoader.run(previous_def, params)
#   end
# end
