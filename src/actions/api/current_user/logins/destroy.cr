class Api::CurrentUser::Logins::Destroy < ApiAction
  include Shield::Api::CurrentUser::Logins::Destroy

  delete "/account/logins" do
    run_operation
  end
end
