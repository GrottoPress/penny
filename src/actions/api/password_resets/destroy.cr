class Api::PasswordResets::Destroy < ApiAction
  include Shield::Api::PasswordResets::Destroy

  delete "/password-resets/:password_reset_id" do
    run_operation
  end
end
