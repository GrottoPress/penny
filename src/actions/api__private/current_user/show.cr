# class CurrentUser::Show < PrivateApi
#   include Shield::Api::EmailConfirmationCurrentUser::Show

#   get "/account" do
#     json UserSerializer.new(user: user)
#   end
# end
