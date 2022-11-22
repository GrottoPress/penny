# class Users::Index < PrivateApi
#   include Shield::Api::Users::Index

#   param page : Int32 = 1

#   get "/users" do
#     json UserSerializer.new(users: users, pages: pages)
#   end
# end
