class CurrentUser::PasswordResets::Index < BrowserAction
  include Shield::CurrentUser::PasswordResets::Index

  get "/account/password-resets" do
    html IndexPage, password_resets: password_resets, pages: pages
  end

  private getter paginated_password_resets : Tuple(
    Lucky::Paginator,
    PasswordResetQuery
  ) do
    query = PasswordResetQueryFilter.run(params)
    query = query.user_id(user.id)

    paginate(query)
  end
end
