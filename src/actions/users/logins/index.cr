class Users::Logins::Index < BrowserAction
  include Shield::Users::Logins::Index

  get "/users/:user_id/logins" do
    html IndexPage, logins: logins, user: user, pages: pages
  end

  private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
    query = LoginQueryFilter.run(params)
    query = query.user_id(user_id)

    paginate(query)
  end
end
