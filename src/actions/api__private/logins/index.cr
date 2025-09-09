# class Logins::Index < PrivateApi
#   include Shield::Api::Logins::Index

#   param count : Int32 = 12
#   param page : Int32 = 1

#   get "/logins" do
#     json LoginSerializer.new(
#       params,
#       logins: logins,
#       current_user: current_user?,
#       pages: pages
#     )
#   end

#   private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
#     query = LoginQuery.new
#     query = LoginQueryLoader.run(query, params)
#     query = LoginQueryFilter.run(query, params)

#     paginate(query, per_page: count.clamp(5, 50))
#   end
# end
