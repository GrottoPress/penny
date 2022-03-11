class Api::CurrentUser::Show < ApiAction
  include Shield::Api::EmailConfirmationCurrentUser::Show

  get "/account" do
    json ItemResponse.new(user: user)
  end
end
