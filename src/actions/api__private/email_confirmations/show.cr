# class EmailConfirmations::Show < PrivateApi
#   include Shield::Api::EmailConfirmations::Show

#   get "/email-confirmations/:email_confirmation_id" do
#     json EmailConfirmationSerializer.new(
#       params,
#       email_confirmation: EmailConfirmationQueryLoader.run(
#         email_confirmation,
#         params
#       ),
#       current_user: current_user?
#     )
#   end
# end
