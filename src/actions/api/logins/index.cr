class Api::Logins::Index < ApiAction
  include Shield::Api::Logins::Index

  param page : Int32 = 1

  get "/logins" do
    json({
      status: "success",
      data: {logins: LoginSerializer.for_collection(logins)},
      pages: PaginationSerializer.new(pages)
    })
  end
end
