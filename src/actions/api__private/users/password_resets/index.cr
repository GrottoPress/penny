# class Users::PasswordResets::Index < PrivateApi
#   include Shield::Api::Users::PasswordResets::Index

#   get "/users/:user_id/password-resets" do
#     json PasswordResetSerializer.new(
#       params,
#       password_resets: password_resets,
#       current_user: current_user?,
#       pages: pages
#     )
#   end

#   private getter paginated_password_resets : Tuple(
#     Lucky::Paginator,
#     PasswordResetQuery
#   ) do
#     query = PasswordResetQueryFilter.run(params)
#     query = PasswordResetQueryLoader.run(query, params)
#     query = query.user_id(user_id)

#     paginate(query)
#   end
# end
