class PasswordResets::Edit < BrowserAction
  include Shield::PasswordResets::Edit

  skip :pin_password_reset_to_ip_address

  get "/password-resets/edit" do
    run_operation
  end
end
