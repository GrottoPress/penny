# class PasswordResets::Token::Verify < PrivateApi
#   include Shield::Api::PasswordResets::Token::Verify

#   skip :pin_password_reset_to_ip_address

#   post "/password-resets/token/verify" do
#     run_operation
#   end
# end
