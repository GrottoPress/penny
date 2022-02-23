class Users::Logins::Destroy < BrowserAction
  include Shield::Users::Logins::Destroy

  delete "/users/:user_id/logins" do
    run_operation
  end
end
