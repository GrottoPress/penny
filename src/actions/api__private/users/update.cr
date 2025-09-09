# class Users::Update < PrivateApi
#   include Shield::Api::Users::Update

#   patch "/users/:user_id" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       params,
#       user: user,
#       current_user: current_user?,
#       message: Rex.t(:"action.user.update.success")
#     )
#   end
# end
