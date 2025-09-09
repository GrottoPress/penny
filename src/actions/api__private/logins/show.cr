# class Logins::Show < PrivateApi
#   include Shield::Api::Logins::Show

#   get "/logins/:login_id" do
#     json LoginSerializer.new(params, login: login, current_user: current_user?)
#   end

#   getter login : Login do
#     LoginQueryLoader.run(previous_def, params)
#   end
# end
