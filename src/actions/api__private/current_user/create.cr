# class CurrentUser::Create < PrivateApi
#   include Shield::Api::EmailConfirmationCurrentUser::Create

#   skip :pin_email_confirmation_to_ip_address

#   post "/account" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       params,
#       user: user,
#       current_user: current_user?,
#       message: Rex.t(:"action.current_user.update.success")
#     )
#   end
# end
