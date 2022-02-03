class Api::PasswordResets::Verify < ApiAction
  include Shield::Api::PasswordResets::Verify

  skip :pin_password_reset_to_ip_address

  post "/password-resets/verify" do
    run_operation
  end
end
