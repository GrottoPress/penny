class Api::Users::Show < PublicApi
  include Shield::Api::Users::Show

  get "/users/:user_id" do
    json UserSerializer.new(user: user)
  end
end
