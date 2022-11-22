# class CurrentUser::Create < PrivateApi
#   include Shield::Api::EmailConfirmationCurrentUser::Create

#   skip :pin_email_confirmation_to_ip_address

#   post "/account" do
#     run_operation
#   end
# end
