class Api::Users::Logins::Index < PublicApi
  include Shield::Api::Users::Logins::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/users/:user_id/logins" do
    json LoginSerializer.new(logins: logins, user: user, pages: pages)
  end

  private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
    query = LoginQuery.new.user_id(user_id)
    query = LoginQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
