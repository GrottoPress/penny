class Users::Index < BrowserAction
  include Shield::Users::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/users" do
    html IndexPage, users: users, pages: pages
  end

  private getter paginated_users : Tuple(Lucky::Paginator, UserQuery) do
    query = UserQuery.new
    query = UserQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
