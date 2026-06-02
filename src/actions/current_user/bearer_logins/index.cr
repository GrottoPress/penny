class CurrentUser::BearerLogins::Index < BrowserAction
  include Shield::CurrentUser::BearerLogins::Index

  get "/account/bearer-logins" do
    html IndexPage, bearer_logins: bearer_logins, pages: pages
  end

  private getter paginated_bearer_logins : Tuple(
    Lucky::Paginator,
    BearerLoginQuery
  ) do
    query = BearerLoginQueryFilter.run(params)
    query = query.user_id(user.id)

    paginate(query)
  end
end
