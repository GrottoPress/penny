# class CurrentUser::BearerLogins::Index < PrivateApi
#   include Shield::Api::CurrentUser::BearerLogins::Index

#   get "/account/bearer-logins" do
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
#     query = BearerLoginQueryFilter.run(params)
#     query = BearerLoginQueryLoader.run(query, params)
#     query = query.user_id(user.id)

#     paginate(query)
#   end
# end
