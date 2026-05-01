# class Logins::Show < PrivateApi
#   include Shield::Api::Logins::Show

#   get "/logins/:login_id" do
#     json LoginSerializer.new(
#       params,
#       login: LoginQueryLoader.run(login, params),
#       current_user: current_user?
#     )
#   end
# end
