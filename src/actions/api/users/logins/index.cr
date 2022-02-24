class Api::Users::Logins::Index < ApiAction
  include Shield::Api::Users::Logins::Index

  param page : Int32 = 1

  get "/users/:user_id/logins" do
    json({
      status: "success",
      data: {logins: LoginSerializer.for_collection(logins)},
      pages: PaginationSerializer.new(pages)
    })
  end
end
