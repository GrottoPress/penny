class Api::Users::PasswordResets::Destroy < ApiAction
  include Shield::Api::Users::PasswordResets::Destroy

  delete "/users/:user_id/password-resets" do
    run_operation
  end
end
