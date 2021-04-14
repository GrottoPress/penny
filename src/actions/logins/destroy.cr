class Logins::Destroy < BrowserAction
  include Shield::Logins::Destroy

  delete "/logins/:login_id" do
    run_operation
  end
end
