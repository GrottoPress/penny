# class EmailConfirmations::Update < PrivateApi
#   include Shield::Api::EmailConfirmations::Update

#   skip :pin_email_confirmation_to_ip_address

#   patch "/email-confirmations" do
#     run_operation
#   end
# end
