class Api::Users::Index < BrowserAction
  include Shield::Api::Users::Index

  param page : Int32 = 1

  get "/users" do
    json({
      status: "success",
      data: {users: UserSerializer.for_collection(users)},
      pages: {
        current: page,
        total: pages.total
      }
    })
  end
end
