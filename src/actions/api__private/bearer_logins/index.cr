# class BearerLogins::Index < PrivateApi
#   include Shield::Api::BearerLogins::Index

#   param count : Int32 = 12
#   param page : Int32 = 1

#   get "/bearer-logins" do
#     json BearerLoginSerializer.new(
#       params,
#       bearer_logins: bearer_logins,
#       current_user: current_user?,
#       pages: pages
#     )
#   end

#   private getter paginated_bearer_logins : Tuple(
#     Lucky::Paginator,
#     BearerLoginQuery
#   ) do
#     query = BearerLoginQuery.new
#     query = BearerLoginQueryLoader.run(query, params)
#     query = BearerLoginQueryFilter.run(query, params)

#     paginate(query, per_page: count.clamp(5, 50))
#   end
# end
