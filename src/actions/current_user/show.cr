class CurrentUser::Show < BrowserAction
  include Shield::EmailConfirmationCurrentUser::Show

  get "/account" do
    html ShowPage, user: user
  end
end
