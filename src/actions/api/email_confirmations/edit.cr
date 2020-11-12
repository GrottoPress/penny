class Api::EmailConfirmations::Edit < ApiAction
  include Shield::Api::EmailConfirmations::Edit

  patch "/email-confirmations" do
    run_operation
  end
end
