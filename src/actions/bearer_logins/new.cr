class BearerLogins::New < BrowserAction
  include Shield::BearerLogins::New

  get "/bearer-logins/new" do
    operation = CreateBearerLogin.new(
      user: user,
      allowed_scopes: BearerScope.action_scopes.map(&.to_s)
    )

    html NewPage, operation: operation
  end
end
