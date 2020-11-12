class Api::CurrentUser::Show < ApiAction
  include Shield::Api::EmailConfirmationCurrentUser::Show

  get "/account" do
    json({
      status: "success",
      data: {user: UserSerializer.new(user)}
    })
  end
end
