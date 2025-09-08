# class CurrentUser::BearerLogins::Destroy < PrivateApi
#   include Shield::Api::CurrentUser::BearerLogins::Destroy

#   delete "/account/bearer-logins" do
#     run_operation
#   end

#   def do_run_operation_succeeded(operation, user)
#     json UserSerializer.new(
#       user: user,
#       message: Rex.t(:"action.current_user.bearer_login.destroy.success")
#     )
#   end
# end
