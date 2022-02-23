class CurrentUser::Logins::Index < BrowserAction
  include Shield::CurrentUser::Logins::Index

  param page : Int32 = 1

  get "/account/logins" do
    html IndexPage, logins: logins, pages: pages
  end
end
