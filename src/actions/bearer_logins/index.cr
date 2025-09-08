class BearerLogins::Index < BrowserAction
  include Shield::BearerLogins::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/bearer-logins" do
    html IndexPage, bearer_logins: bearer_logins, pages: pages
  end

  private getter paginated_bearer_logins : Tuple(
    Lucky::Paginator,
    BearerLoginQuery
  ) do
    query = BearerLoginQuery.new
    query = BearerLoginQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
