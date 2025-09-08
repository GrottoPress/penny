# class PasswordResets::Destroy < PrivateApi
#   include Shield::Api::PasswordResets::Destroy

#   delete "/password-resets/:password_reset_id" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, password_reset)
#     json PasswordResetSerializer.new(
#       password_reset: PasswordResetQueryLoader.run(password_reset, params),
#       message: Rex.t(:"action.password_reset.destroy.success")
#     )
#   end
# end
