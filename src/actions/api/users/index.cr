class Api::Users::Index < ApiAction
  include Shield::Api::Users::Index

  param page : Int32 = 1

  get "/users" do
    json({
      status: "success",
      data: {users: UserSerializer.for_collection(users)},
      pages: PaginationSerializer.new(pages)
    })
  end
end
