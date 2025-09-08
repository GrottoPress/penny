# class CurrentUser::PasswordResets::Destroy < PrivateApi
#   include Shield::Api::CurrentUser::PasswordResets::Destroy

#   delete "/account/password-resets" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, password_reset)
#     json PasswordResetSerializer.new(
#       password_reset: PasswordResetQueryLoader.run(password_reset, params),
#       message: Rex.t(:"action.current_user.password_reset.destroy.success")
#     )
#   end
# end
