class Logins::Index < BrowserAction
  include Shield::Logins::Index

  get "/logins" do
    html IndexPage, logins: logins, pages: pages
  end

  private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
    query = LoginQueryFilter.run(params)

    paginate(query)
  end
end
