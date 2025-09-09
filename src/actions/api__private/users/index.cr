# class Users::Index < PrivateApi
#   include Shield::Api::Users::Index

#   param count : Int32 = 12
#   param page : Int32 = 1

#   get "/users" do
#     json UserSerializer.new(
#       params,
#       users: users,
#       current_user: current_user?,
#       pages: pages
#     )
#   end

#   private getter paginated_users : Tuple(Lucky::Paginator, UserQuery) do
#     query = UserQuery.new
#     query = UserQueryFilter.run(query, params)

#     paginate(query, per_page: count.clamp(5, 50))
#   end
# end
