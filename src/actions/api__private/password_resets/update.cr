# class PasswordResets::Update < PrivateApi
#   include Shield::Api::PasswordResets::Update

#   skip :pin_password_reset_to_ip_address

#   patch "/password-resets" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, password_reset)
#     json PasswordResetSerializer.new(
#       params,
#       password_reset: PasswordResetQueryLoader.run(password_reset, params),
#       current_user: current_user?,
#       message: Rex.t(:"action.password_reset.update.success")
#     )
#   end
# end
