class Api::CurrentUser::EmailConfirmations::Destroy < ApiAction
  include Shield::Api::CurrentUser::EmailConfirmations::Destroy

  delete "/account/email-confirmations" do
    run_operation
  end
end
