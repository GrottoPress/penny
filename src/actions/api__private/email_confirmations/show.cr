# class EmailConfirmations::Show < PrivateApi
#   include Shield::Api::EmailConfirmations::Show

#   get "/email-confirmations/:email_confirmation_id" do
#     json EmailConfirmationSerializer.new(email_confirmation: email_confirmation)
#   end

#   getter email_confirmation : EmailConfirmation do
#     EmailConfirmationQueryLoader.run(previous_def, params)
#   end
# end
