class Users::PasswordResets::Destroy < BrowserAction
  include Shield::Users::PasswordResets::Destroy

  delete "/users/:user_id/password-resets" do
    run_operation
  end
end
