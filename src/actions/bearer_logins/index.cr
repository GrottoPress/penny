class BearerLogins::Index < BrowserAction
  include Shield::BearerLogins::Index

  get "/bearer-logins" do
    html IndexPage, bearer_logins: bearer_logins, pages: pages
  end

  private getter paginated_bearer_logins : Tuple(
    Lucky::Paginator,
    BearerLoginQuery
  ) do
    query = BearerLoginQueryFilter.run(params)

    paginate(query)
  end
end
