class EmailConfirmations::Index < BrowserAction
  include Shield::EmailConfirmations::Index

  get "/email-confirmations" do
    html IndexPage, email_confirmations: email_confirmations, pages: pages
  end

  private getter paginated_email_confirmations : Tuple(
    Lucky::Paginator,
    EmailConfirmationQuery
  ) do
    query = EmailConfirmationQueryFilter.run(params)

    paginate(query)
  end
end
