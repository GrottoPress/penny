# class EmailConfirmations::Update < PrivateApi
#   include Shield::Api::EmailConfirmations::Update

#   skip :pin_email_confirmation_to_ip_address

#   patch "/email-confirmations" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, email_confirmation)
#     email_confirmation = EmailConfirmationQueryLoader.run(
#       email_confirmation,
#       params
#     )

#     json EmailConfirmationSerializer.new(
#       email_confirmation: email_confirmation,
#       message: Rex.t(:"action.email_confirmation.destroy.success")
#     )
#   end
# end
