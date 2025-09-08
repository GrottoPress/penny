class Logins::Index < BrowserAction
  include Shield::Logins::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/logins" do
    html IndexPage, logins: logins, pages: pages
  end

  private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
    query = LoginQuery.new
    query = LoginQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
