class BearerLogins::New < BrowserAction
  include Shield::BearerLogins::New

  get "/bearer-logins/new" do
    operation = CreateBearerLogin.new(
      all_scopes: BearerLoginHelper.all_scopes
    )

    html NewPage, operation: operation
  end
end
