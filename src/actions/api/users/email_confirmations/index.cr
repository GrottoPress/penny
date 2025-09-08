class Api::Users::EmailConfirmations::Index < PublicApi
  include Shield::Api::Users::EmailConfirmations::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/users/:user_id/email-confirmations" do
    json EmailConfirmationSerializer.new(
      email_confirmations: email_confirmations,
      user: user,
      pages: pages
    )
  end

  private getter paginated_email_confirmations : Tuple(
    Lucky::Paginator,
    EmailConfirmationQuery
  ) do
    query = EmailConfirmationQuery.new.user_id(user_id)
    query = EmailConfirmationQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
