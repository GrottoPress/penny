class Api::CurrentUser::BearerLogins::Destroy < ApiAction
  include Shield::Api::CurrentUser::BearerLogins::Destroy

  delete "/account/bearer-logins" do
    run_operation
  end
end
