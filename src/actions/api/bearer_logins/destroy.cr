class Api::BearerLogins::Destroy < ApiAction
  include Shield::Api::BearerLogins::Destroy

  delete "/bearer-logins/:bearer_login_id" do
    run_operation
  end
end
