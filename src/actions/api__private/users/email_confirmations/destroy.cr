# class Users::EmailConfirmations::Destroy < PrivateApi
#   include Shield::Api::Users::EmailConfirmations::Destroy

#   delete "/users/:user_id/email-confirmations" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       user: user,
#       message: Rex.t(:"action.user.email_confirmation.destroy.success")
#     )
#   end
# end
