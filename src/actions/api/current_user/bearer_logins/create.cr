class Api::CurrentUser::BearerLogins::Create < ApiAction
  include Shield::Api::CurrentUser::BearerLogins::Create

  post "/account/bearer-logins" do
    run_operation
  end
end
