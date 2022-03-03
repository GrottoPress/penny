class Users::EmailConfirmations::Destroy < BrowserAction
  include Shield::Users::EmailConfirmations::Destroy

  delete "/users/:user_id/email-confirmations" do
    run_operation
  end
end
