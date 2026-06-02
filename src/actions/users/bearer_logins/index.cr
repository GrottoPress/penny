class Users::BearerLogins::Index < BrowserAction
  include Shield::Users::BearerLogins::Index

  get "/users/:user_id/bearer-logins" do
    html IndexPage, bearer_logins: bearer_logins, user: user, pages: pages
  end

  private getter paginated_bearer_logins : Tuple(
    Lucky::Paginator,
    BearerLoginQuery
  ) do
    query = BearerLoginQueryFilter.run(params)
    query = query.user_id(user_id)

    paginate(query)
  end
end
