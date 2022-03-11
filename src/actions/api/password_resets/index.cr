class Api::PasswordResets::Index < ApiAction
  include Shield::Api::PasswordResets::Index

  param page : Int32 = 1

  get "/password-resets" do
    json ListResponse.new(password_resets: password_resets, pages: pages)
  end
end
