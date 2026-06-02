class Api::BearerLogins::Index < PublicApi
  include Shield::Api::BearerLogins::Index

  get "/bearer-logins" do
    json BearerLoginSerializer.new(
      params,
      bearer_logins: bearer_logins,
      current_user: current_user?,
      pages: pages
    )
  end

  private getter paginated_bearer_logins : Tuple(
    Lucky::Paginator,
    BearerLoginQuery
  ) do
    query = BearerLoginQueryFilter.run(params)
    query = BearerLoginQueryLoader.run(query, params)

    paginate(query)
  end
end
