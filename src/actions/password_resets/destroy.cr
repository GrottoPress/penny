class PasswordResets::Destroy < BrowserAction
  include Shield::PasswordResets::Destroy

  delete "/password-resets/:password_reset_id" do
    run_operation
  end
end
