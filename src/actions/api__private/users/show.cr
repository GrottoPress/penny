# class Users::Show < PrivateApi
#   include Shield::Api::Users::Show

#   get "/users/:user_id" do
#     json UserSerializer.new(params, user: user, current_user: current_user?)
#   end
# end
