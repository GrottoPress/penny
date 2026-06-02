class BearerLogins::Token::Show < BrowserAction
  include Shield::BearerLogins::Token::Show

  get "/bearer-logins/token" do
    html ShowPage, bearer_login: bearer_login, token: token
  end
end
