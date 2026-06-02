class PasswordResets::Index < BrowserAction
  include Shield::PasswordResets::Index

  get "/password-resets" do
    html IndexPage, password_resets: password_resets, pages: pages
  end

  private getter paginated_password_resets : Tuple(
    Lucky::Paginator,
    PasswordResetQuery
  ) do
    query = PasswordResetQueryFilter.run(params)

    paginate(query)
  end
end
