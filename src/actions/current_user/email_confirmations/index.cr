class CurrentUser::EmailConfirmations::Index < BrowserAction
  include Shield::CurrentUser::EmailConfirmations::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/account/email-confirmations" do
    html IndexPage, email_confirmations: email_confirmations, pages: pages
  end

  private getter paginated_email_confirmations : Tuple(
    Lucky::Paginator,
    EmailConfirmationQuery
  ) do
    query = EmailConfirmationQuery.new.user_id(user.id)
    query = EmailConfirmationQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
