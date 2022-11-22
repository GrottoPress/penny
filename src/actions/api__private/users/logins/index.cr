# class Users::Logins::Index < PrivateApi
#   include Shield::Api::Users::Logins::Index

#   param page : Int32 = 1

#   get "/users/:user_id/logins" do
#     json LoginSerializer.new(logins: logins, user: user, pages: pages)
#   end
# end
