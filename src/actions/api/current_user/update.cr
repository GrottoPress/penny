class Api::CurrentUser::Update < ApiAction
  include Shield::Api::EmailConfirmationCurrentUser::Update

  patch "/account" do
    run_operation
  end
end
