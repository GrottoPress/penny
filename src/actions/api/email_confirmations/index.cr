class Api::EmailConfirmations::Index < PublicApi
  include Shield::Api::EmailConfirmations::Index

  get "/email-confirmations" do
    json EmailConfirmationSerializer.new(
      params,
      email_confirmations: email_confirmations,
      current_user: current_user?,
      pages: pages
    )
  end

  private getter paginated_email_confirmations : Tuple(
    Lucky::Paginator,
    EmailConfirmationQuery
  ) do
    query = EmailConfirmationQueryFilter.run(params)
    query = EmailConfirmationQueryLoader.run(query, params)

    paginate(query)
  end
end
