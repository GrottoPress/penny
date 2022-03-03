class Api::Users::EmailConfirmations::Destroy < ApiAction
  include Shield::Api::Users::EmailConfirmations::Destroy

  delete "/users/:user_id/email-confirmations" do
    run_operation
  end
end
