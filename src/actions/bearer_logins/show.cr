class BearerLogins::Show < BrowserAction
  include Shield::BearerLogins::Show

  param page : Int32 = 1

  get "/bearer-logins/:bearer_login_id" do
    html ShowPage, bearer_login: bearer_login, token: token
  end
end
