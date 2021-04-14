class Api::Logins::Destroy < ApiAction
  include Shield::Api::Logins::Destroy

  delete "/logins/:login_id" do
    run_operation
  end
end
