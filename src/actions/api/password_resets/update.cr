class Api::PasswordResets::Update < ApiAction
  include Shield::Api::PasswordResets::Update

  skip :pin_password_reset_to_ip_address

  patch "/password-resets" do
    run_operation
  end
end
