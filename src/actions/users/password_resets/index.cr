class Users::PasswordResets::Index < BrowserAction
  include Shield::Users::PasswordResets::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/users/:user_id/password-resets" do
    html IndexPage, password_resets: password_resets, user: user, pages: pages
  end

  private getter paginated_password_resets : Tuple(
    Lucky::Paginator,
    PasswordResetQuery
  ) do
    query = PasswordResetQueryFilter.run(params)
    query = query.user_id(user_id)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
