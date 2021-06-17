class Logins::Index < BrowserAction
  include Shield::Logins::Index

  param page : Int32 = 1

  get "/logins" do
    html IndexPage, logins: logins, pages: pages
  end
end
