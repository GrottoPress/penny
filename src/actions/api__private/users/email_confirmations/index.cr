# class Users::EmailConfirmations::Index < PrivateApi
#   include Shield::Api::Users::EmailConfirmations::Index

#   get "/users/:user_id/email-confirmations" do
#     json EmailConfirmationSerializer.new(
#       params,
#       email_confirmations: email_confirmations,
#       current_user: current_user?,
#       pages: pages
#     )
#   end

#   private getter paginated_email_confirmations : Tuple(
#     Lucky::Paginator,
#     EmailConfirmationQuery
#   ) do
#     query = EmailConfirmationQueryFilter.run(params)
#     query = EmailConfirmationQueryLoader.run(query, params)
#     query = query.user_id(user_id)

#     paginate(query)
#   end
# end
