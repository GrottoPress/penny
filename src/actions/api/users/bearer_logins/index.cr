class Api::Users::BearerLogins::Index < PublicApi
  include Shield::Api::Users::BearerLogins::Index

  get "/users/:user_id/bearer-logins" do
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
    query = query.user_id(user_id)

    paginate(query)
  end
end
