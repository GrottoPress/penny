class CurrentUser::EmailConfirmations::Destroy < BrowserAction
  include Shield::CurrentUser::EmailConfirmations::Destroy

  delete "/account/email-confirmations" do
    run_operation
  end
end
