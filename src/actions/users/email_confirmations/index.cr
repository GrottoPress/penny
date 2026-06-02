class Users::EmailConfirmations::Index < BrowserAction
  include Shield::Users::EmailConfirmations::Index

  get "/users/:user_id/email-confirmations" do
    html IndexPage, email_confirmations: email_confirmations, user: user, pages: pages
  end

  private getter paginated_email_confirmations : Tuple(
    Lucky::Paginator,
    EmailConfirmationQuery
  ) do
    query = EmailConfirmationQueryFilter.run(params)
    query = query.user_id(user_id)

    paginate(query)
  end
end
