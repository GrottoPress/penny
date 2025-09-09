# class BearerLogins::Show < PrivateApi
#   include Shield::Api::BearerLogins::Show

#   get "/bearer-logins/:bearer_login_id" do
#     json BearerLoginSerializer.new(
#       params,
#       bearer_login: bearer_login,
#       current_user: current_user?
#     )
#   end

#   getter bearer_login : BearerLogin do
#     BearerLoginQueryLoader.run(previous_def, params)
#   end
# end
