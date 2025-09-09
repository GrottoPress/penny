# class EmailConfirmations::Destroy < PrivateApi
#   include Shield::Api::EmailConfirmations::Destroy

#   delete "/email-confirmations/:email_confirmation_id" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, email_confirmation)
#     email_confirmation = EmailConfirmationQueryLoader.run(
#       email_confirmation,
#       params
#     )

#     json EmailConfirmationSerializer.new(
#       params,
#       email_confirmation: email_confirmation,
#       current_user: current_user?,
#       message: Rex.t(:"action.email_confirmation.destroy.success")
#     )
#   end
# end
