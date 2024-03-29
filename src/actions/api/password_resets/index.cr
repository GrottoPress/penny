class Api::PasswordResets::Index < PublicApi
  include Shield::Api::PasswordResets::Index

  param page : Int32 = 1

  get "/password-resets" do
    json PasswordResetSerializer.new(
      password_resets: password_resets,
      pages: pages
    )
  end
end
