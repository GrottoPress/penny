# class EmailConfirmations::Token::Verify < PrivateApi
#   include Shield::Api::EmailConfirmations::Token::Verify

#   skip :pin_email_confirmation_to_ip_address

#   post "/email-confirmations/token/verify" do
#     run_operation
#   end

#   def do_verify_operation_succeeded(utility, email_confirmation)
#     email_confirmation = EmailConfirmationQueryLoader.run(
#       email_confirmation,
#       params
#     )

#     json EmailConfirmationSerializer.new(
#       email_confirmation: email_confirmation,
#       message: Rex.t(:"action.email_confirmation.verify.success")
#     )
#   end
# end
