class Api::Users::BearerLogins::Destroy < ApiAction
  include Shield::Api::Users::BearerLogins::Destroy

  delete "/users/:user_id/bearer-logins" do
    run_operation
  end
end
