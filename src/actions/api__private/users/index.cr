# class Users::Index < PrivateApi
#   include Shield::Api::Users::Index

#   get "/users" do
#     json UserSerializer.new(
#       params,
#       users: users,
#       current_user: current_user?,
#       pages: pages
#     )
#   end

#   private getter paginated_users : Tuple(Lucky::Paginator, UserQuery) do
#     query = UserQueryFilter.run(params)

#     paginate(query)
#   end
# end
