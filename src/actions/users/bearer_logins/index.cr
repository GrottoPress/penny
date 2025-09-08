class Users::BearerLogins::Index < BrowserAction
  include Shield::Users::BearerLogins::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/users/:user_id/bearer-logins" do
    html IndexPage, bearer_logins: bearer_logins, user: user, pages: pages
  end

  private getter paginated_bearer_logins : Tuple(
    Lucky::Paginator,
    BearerLoginQuery
  ) do
    query = BearerLoginQuery.new.user_id(user_id)
    query = BearerLoginQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
