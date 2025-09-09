# class PasswordResets::Token::Verify < PrivateApi
#   include Shield::Api::PasswordResets::Token::Verify

#   skip :pin_password_reset_to_ip_address

#   post "/password-resets/token/verify" do
#     run_operation
#   end

#   def do_verify_operation_succeeded(utility, password_reset)
#     json PasswordResetSerializer.new(
#       params,
#       password_reset: PasswordResetQueryLoader.run(password_reset, params),
#       current_user: current_user?,
#       message: Rex.t(:"action.password_reset.verify.success")
#     )
#   end
# end
