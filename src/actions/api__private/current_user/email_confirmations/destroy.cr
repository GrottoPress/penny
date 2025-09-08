# class CurrentUser::EmailConfirmations::Destroy < PrivateApi
#   include Shield::Api::CurrentUser::EmailConfirmations::Destroy

#   delete "/account/email-confirmations" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       user: user,
#       message: Rex.t(:"action.current_user.email_confirmation.destroy.success")
#     )
#   end
# end
