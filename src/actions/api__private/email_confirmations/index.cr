# class EmailConfirmations::Index < PrivateApi
#   include Shield::Api::EmailConfirmations::Index

#   param page : Int32 = 1

#   get "/email-confirmations" do
#     json EmailConfirmationSerializer.new(
#       email_confirmations: email_confirmations,
#       pages: pages
#     )
#   end
# end
