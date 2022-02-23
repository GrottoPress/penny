class Api::Users::Logins::Destroy < ApiAction
  include Shield::Api::Users::Logins::Destroy

  delete "/users/:user_id/logins" do
    run_operation
  end
end
