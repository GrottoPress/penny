class Users::Edit < BrowserAction
  include Shield::Users::Edit

  get "/users/:user_id/edit" do
    operation = UpdateUser.new(user, current_login: current_login?)
    html EditPage, operation: operation
  end
end
