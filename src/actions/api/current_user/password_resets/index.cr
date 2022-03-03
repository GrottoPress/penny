class Api::CurrentUser::PasswordResets::Index < ApiAction
  include Shield::Api::CurrentUser::PasswordResets::Index

  param page : Int32 = 1

  get "/account/password-resets" do
    json({
      status: "success",
      data: {password_resets: PasswordResetSerializer.for_collection(
        password_resets
      )},
      pages: PaginationSerializer.new(pages)
    })
  end
end
