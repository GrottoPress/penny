class CurrentUser::Update < BrowserAction
  include Shield::EmailConfirmationCurrentUser::Update

  patch "/account" do
    run_operation
  end
end
