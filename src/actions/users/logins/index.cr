class Users::Logins::Index < BrowserAction
  include Shield::Users::Logins::Index

  param page : Int32 = 1

  get "/users/:user_id/logins" do
    html IndexPage, logins: logins, user: user, pages: pages
  end
end
