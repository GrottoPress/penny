class Api::Users::Show < BrowserAction
  include Shield::Api::Users::Show

  get "/users/:user_id" do
    json({
      status: "success",
      data: {user: UserSerializer.new(user)}
    })
  end
end
