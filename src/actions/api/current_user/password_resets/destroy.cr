class Api::CurrentUser::PasswordResets::Destroy < ApiAction
  include Shield::Api::CurrentUser::PasswordResets::Destroy

  delete "/account/password-resets" do
    run_operation
  end
end
