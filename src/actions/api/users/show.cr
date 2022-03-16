class Api::Users::Show < ApiAction
  include Shield::Api::Users::Show

  get "/users/:user_id" do
    json UserSerializer.new(user: user)
  end
end
