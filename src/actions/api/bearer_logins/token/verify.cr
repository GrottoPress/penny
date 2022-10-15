class Api::BearerLogins::Token::Verify < ApiAction
  include Shield::Api::BearerLogins::Token::Verify

  post "/bearer-logins/token/verify" do
    run_operation
  end
end
