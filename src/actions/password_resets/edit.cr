class PasswordResets::Edit < BrowserAction
  include Shield::PasswordResets::Edit

  get "/password-resets/edit" do
    run_operation
  end
end
