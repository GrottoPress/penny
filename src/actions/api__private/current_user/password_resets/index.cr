# class CurrentUser::PasswordResets::Index < PrivateApi
#   include Shield::Api::CurrentUser::PasswordResets::Index

#   param count : Int32 = 12
#   param page : Int32 = 1

#   get "/account/password-resets" do
#     json PasswordResetSerializer.new(
#       password_resets: password_resets,
#       pages: pages
#     )
#   end

#   private getter paginated_password_resets : Tuple(
#     Lucky::Paginator,
#     PasswordResetQuery
#   ) do
#     query = PasswordResetQuery.new.user_id(user.id)
#     query = PasswordResetQueryLoader.run(query, params)
#     query = PasswordResetQueryFilter.run(query, params)

#     paginate(query, per_page: count.clamp(5, 50))
#   end
# end
