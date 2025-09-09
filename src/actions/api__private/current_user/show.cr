# class CurrentUser::Show < PrivateApi
#   include Shield::Api::EmailConfirmationCurrentUser::Show

#   get "/account" do
#     json UserSerializer.new(params, user: user, current_user: current_user?)
#   end
# end
