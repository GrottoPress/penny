class Api::PasswordResets::Index < ApiAction
  include Shield::Api::PasswordResets::Index

  param page : Int32 = 1

  get "/password-resets" do
    json({
      status: "success",
      data: {password_resets: PasswordResetSerializer.for_collection(
        password_resets
      )},
      pages: PaginationSerializer.new(pages)
    })
  end
end
