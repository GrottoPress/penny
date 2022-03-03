class CurrentUser::PasswordResets::Destroy < BrowserAction
  include Shield::CurrentUser::PasswordResets::Destroy

  delete "/account/password-resets" do
    run_operation
  end
end
