class Api::CurrentUser::PasswordResets::Index < ApiAction
  include Shield::Api::CurrentUser::PasswordResets::Index

  param page : Int32 = 1

  get "/account/password-resets" do
    json ListResponse.new(password_resets: password_resets, pages: pages)
  end
end
