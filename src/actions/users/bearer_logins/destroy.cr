class Users::BearerLogins::Destroy < BrowserAction
  include Shield::Users::BearerLogins::Destroy

  delete "/users/:user_id/bearer-logins" do
    run_operation
  end
end
