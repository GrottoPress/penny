# class CurrentUser::Logins::Index < PrivateApi
#   include Shield::Api::CurrentUser::Logins::Index

#   get "/account/logins" do
#     json LoginSerializer.new(
#       params,
#       logins: logins,
#       current_user: current_user?,
#       pages: pages
#     )
#   end

#   private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
#     query = LoginQueryFilter.run(params)
#     query = LoginQueryLoader.run(query, params)
#     query = query.user_id(user.id)

#     paginate(query)
#   end
# end
