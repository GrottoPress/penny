# class PasswordResets::Create < PrivateApi
#   include Shield::Api::PasswordResets::Create

#   post "/password-resets" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, password_reset)
#     json PasswordResetSerializer.new(
#       params,
#       password_reset: PasswordResetQueryLoader.run(password_reset, params),
#       current_user: current_user?,
#       message: Rex.t(:"action.password_reset.create.success")
#     )
#   end
# end
