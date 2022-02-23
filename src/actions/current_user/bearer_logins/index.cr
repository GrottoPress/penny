class CurrentUser::BearerLogins::Index < BrowserAction
  include Shield::CurrentUser::BearerLogins::Index

  param page : Int32 = 1

  get "/account/bearer-logins" do
    html IndexPage, bearer_logins: bearer_logins, pages: pages
  end
end
