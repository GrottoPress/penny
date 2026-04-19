class Api::CurrentUser::Logins::Index < PublicApi
  include Shield::Api::CurrentUser::Logins::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/account/logins" do
    json LoginSerializer.new(
      params,
      logins: logins,
      current_user: current_user_or_bearer?,
      pages: pages
    )
  end

  private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
    query = LoginQueryFilter.run(params)
    query = LoginQueryLoader.run(query, params)
    query = query.user_id(user.id)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
