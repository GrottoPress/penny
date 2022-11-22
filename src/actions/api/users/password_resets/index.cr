class Api::Users::PasswordResets::Index < PublicApi
  include Shield::Api::Users::PasswordResets::Index

  param page : Int32 = 1

  get "/users/:user_id/password-resets" do
    json PasswordResetSerializer.new(
      password_resets: password_resets,
      user: user,
      pages: pages
    )
  end
end
