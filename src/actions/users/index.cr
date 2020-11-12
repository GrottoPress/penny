class Users::Index < BrowserAction
  include Shield::Users::Index

  param page : Int32 = 1

  get "/users" do
    html IndexPage, users: users, pages: pages
  end
end
