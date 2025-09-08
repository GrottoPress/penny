# class Logins::Show < PrivateApi
#   include Shield::Api::Logins::Show

#   get "/logins/:login_id" do
#     json LoginSerializer.new(login: login)
#   end

#   getter login : Login do
#     LoginQueryLoader.run(previous_def, params)
#   end
# end
