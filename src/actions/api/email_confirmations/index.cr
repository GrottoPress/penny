class Api::EmailConfirmations::Index < PublicApi
  include Shield::Api::EmailConfirmations::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/email-confirmations" do
    json EmailConfirmationSerializer.new(
      email_confirmations: email_confirmations,
      pages: pages
    )
  end

  private getter paginated_email_confirmations : Tuple(
    Lucky::Paginator,
    EmailConfirmationQuery
  ) do
    query = EmailConfirmationQuery.new
    query = EmailConfirmationQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
