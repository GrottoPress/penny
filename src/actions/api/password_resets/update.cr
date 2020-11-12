class Api::PasswordResets::Update < ApiAction
  include Shield::Api::PasswordResets::Update

  patch "/password-resets" do
    run_operation
  end
end
