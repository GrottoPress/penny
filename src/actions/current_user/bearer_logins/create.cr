class CurrentUser::BearerLogins::Create < BrowserAction
  include Shield::CurrentUser::BearerLogins::Create

  post "/account/bearer-logins" do
    run_operation
  end
end
