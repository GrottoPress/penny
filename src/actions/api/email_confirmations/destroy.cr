class Api::EmailConfirmations::Destroy < ApiAction
  include Shield::Api::EmailConfirmations::Destroy

  delete "/email-confirmations/:email_confirmation_id" do
    run_operation
  end
end
