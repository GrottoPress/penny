class Api::CurrentUser::EmailConfirmations::Index < PublicApi
  include Shield::Api::CurrentUser::EmailConfirmations::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/account/email-confirmations" do
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
    query = query.user_id(user.id)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
