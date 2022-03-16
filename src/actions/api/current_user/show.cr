class Api::CurrentUser::Show < ApiAction
  include Shield::Api::EmailConfirmationCurrentUser::Show

  get "/account" do
    json UserSerializer.new(user: user)
  end
end
