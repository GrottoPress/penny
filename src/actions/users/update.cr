class Users::Update < BrowserAction
  include Shield::Users::Update

  patch "/users/:user_id" do
    run_operation
  end
end
