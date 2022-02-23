class Users::BearerLogins::Index < BrowserAction
  include Shield::Users::BearerLogins::Index

  param page : Int32 = 1

  get "/users/:user_id/bearer-logins" do
    html IndexPage, bearer_logins: bearer_logins, user: user, pages: pages
  end
end
