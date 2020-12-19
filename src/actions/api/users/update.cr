class Api::Users::Update < ApiAction
  include Shield::Api::Users::Update

  patch "/users/:user_id" do
    run_operation
  end
end
