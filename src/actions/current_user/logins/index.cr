class CurrentUser::Logins::Index < BrowserAction
  include Shield::CurrentUser::Logins::Index

  get "/account/logins" do
    html IndexPage, logins: logins, pages: pages
  end

  private getter paginated_logins : Tuple(Lucky::Paginator, LoginQuery) do
    query = LoginQueryFilter.run(params)
    query = query.user_id(user.id)

    paginate(query)
  end
end
