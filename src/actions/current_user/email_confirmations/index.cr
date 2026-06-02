class CurrentUser::EmailConfirmations::Index < BrowserAction
  include Shield::CurrentUser::EmailConfirmations::Index

  get "/account/email-confirmations" do
    html IndexPage, email_confirmations: email_confirmations, pages: pages
  end

  private getter paginated_email_confirmations : Tuple(
    Lucky::Paginator,
    EmailConfirmationQuery
  ) do
    query = EmailConfirmationQueryFilter.run(params)
    query = query.user_id(user.id)

    paginate(query)
  end
end
