class PasswordResets::Index < BrowserAction
  include Shield::PasswordResets::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/password-resets" do
    html IndexPage, password_resets: password_resets, pages: pages
  end

  private getter paginated_password_resets : Tuple(
    Lucky::Paginator,
    PasswordResetQuery
  ) do
    query = PasswordResetQuery.new
    query = PasswordResetQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
