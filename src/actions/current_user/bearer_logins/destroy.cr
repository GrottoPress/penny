class CurrentUser::BearerLogins::Destroy < BrowserAction
  include Shield::CurrentUser::BearerLogins::Destroy

  delete "/account/bearer-logins" do
    run_operation
  end
end
