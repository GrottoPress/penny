class Api::Users::Show < ApiAction
  include Shield::Api::Users::Show

  get "/users/:user_id" do
    json({
      status: "success",
      data: {user: UserSerializer.new(user)}
    })
  end
end
