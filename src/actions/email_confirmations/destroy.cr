class EmailConfirmations::Destroy < BrowserAction
  include Shield::EmailConfirmations::Destroy

  delete "/email-confirmations/:email_confirmation_id" do
    run_operation
  end
end
