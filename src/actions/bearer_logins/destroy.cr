class BearerLogins::Destroy < BrowserAction
  include Shield::BearerLogins::Destroy

  delete "/bearer-logins/:bearer_login_id" do
    run_operation
  end
end
