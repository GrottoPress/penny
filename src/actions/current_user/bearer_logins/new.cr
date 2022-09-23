class CurrentUser::BearerLogins::New < BrowserAction
  include Shield::CurrentUser::BearerLogins::New

  get "/account/bearer-logins/new" do
    operation = CreateBearerLogin.new(user: user)
    html NewPage, operation: operation
  end
end
