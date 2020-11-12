class Users::Show < BrowserAction
  include Shield::Users::Show

  get "/users/:user_id" do
    html ShowPage, user: user
  end
end
