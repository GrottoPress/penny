class Api::Users::Index < ApiAction
  include Shield::Api::Users::Index

  param page : Int32 = 1

  get "/users" do
    json ListResponse.new(users: users, pages: pages)
  end
end
