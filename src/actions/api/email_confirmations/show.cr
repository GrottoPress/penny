# class Api::EmailConfirmations::Show < PublicApi
#   include Shield::Api::EmailConfirmations::Show

#   get "/email-confirmations/:email_confirmation_id" do
#     json EmailConfirmationSerializer.new(
#       params,
#       email_confirmation: email_confirmation,
#       current_user: current_user_or_bearer?
#     )
#   end

#   getter email_confirmation : EmailConfirmation do
#     EmailConfirmationQueryLoader.run(previous_def, params)
#   end
# end
