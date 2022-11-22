# class Logins::Index < PrivateApi
#   include Shield::Api::Logins::Index

#   param page : Int32 = 1

#   get "/logins" do
#     json LoginSerializer.new(logins: logins, pages: pages)
#   end
# end
