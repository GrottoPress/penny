class Logins::Index < BrowserAction
  include Shield::Logins::Index

  param page : Int32 = 1

  get "/logins" do
    html IndexPage, logins: active_logins, pages: pages
  end

  private def active_logins
    logins.select &.active?
  end
end
