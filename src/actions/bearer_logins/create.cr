class BearerLogins::Create < BrowserAction
  include Shield::BearerLogins::Create

  post "/bearer-logins" do
    run_operation
  end
end
