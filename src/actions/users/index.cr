class Users::Index < BrowserAction
  include Shield::Users::Index

  get "/users" do
    html IndexPage, users: users, pages: pages
  end

  private getter paginated_users : Tuple(Lucky::Paginator, UserQuery) do
    query = UserQueryFilter.run(params)

    paginate(query)
  end
end
