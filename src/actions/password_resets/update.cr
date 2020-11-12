class PasswordResets::Update < BrowserAction
  include Shield::PasswordResets::Update

  patch "/password-resets" do
    run_operation
  end
end
