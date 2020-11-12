class Api::Users::Update < BrowserAction
  include Shield::Api::Users::Update

  patch "/users/:user_id" do
    run_operation
  end
end
