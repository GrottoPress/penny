class CurrentUser::Logins::Destroy < BrowserAction
  include Shield::CurrentUser::Logins::Destroy

  delete "/account/logins" do
    run_operation
  end
end
