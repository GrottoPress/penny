class Api::Logins::Index < PublicApi
  include Shield::Api::Logins::Index

  get "/logins" do
    json LoginSerializer.new(
      params,
      logins: logins,
      current_user: current_user?,
      pages: pages
    )
  end

  private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
    query = LoginQueryFilter.run(params)
    query = LoginQueryLoader.run(query, params)

    paginate(query)
  end
end
