# class CurrentUser::PasswordResets::Destroy < PrivateApi
#   include Shield::Api::CurrentUser::PasswordResets::Destroy

#   delete "/account/password-resets" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, password_reset)
#     json PasswordResetSerializer.new(
#       params,
#       password_reset: PasswordResetQueryLoader.run(password_reset, params),
#       current_user: current_user?,
#       message: Rex.t(:"action.current_user.password_reset.destroy.success")
#     )
#   end
# end
