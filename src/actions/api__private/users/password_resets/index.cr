# class Users::PasswordResets::Index < PrivateApi
#   include Shield::Api::Users::PasswordResets::Index

#   param count : Int32 = 12
#   param page : Int32 = 1

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
#     query = PasswordResetQuery.new.user_id(user_id)
#     query = PasswordResetQueryLoader.run(query, params)
#     query = PasswordResetQueryFilter.run(query, params)

#     paginate(query, per_page: count.clamp(5, 50))
#   end
# end
