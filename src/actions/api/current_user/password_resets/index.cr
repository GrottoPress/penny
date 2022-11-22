class Api::CurrentUser::PasswordResets::Index < PublicApi
  include Shield::Api::CurrentUser::PasswordResets::Index

  param page : Int32 = 1

  get "/account/password-resets" do
    json PasswordResetSerializer.new(
      password_resets: password_resets,
      pages: pages
    )
  end
end
