class CurrentUser::BearerLogins::New < BrowserAction
  include Shield::CurrentUser::BearerLogins::New

  get "/account/bearer-logins/new" do
    operation = CreateBearerLogin.new(
      user: user,
      allowed_scopes: BearerScope.action_scopes.map(&.to_s)
    )

    html NewPage, operation: operation
  end
end
