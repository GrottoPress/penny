class Api::BearerLogins::Create < ApiAction
  include Shield::Api::BearerLogins::Create

  post "/bearer-logins" do
    run_operation
  end
end
