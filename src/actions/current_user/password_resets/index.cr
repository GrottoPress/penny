class CurrentUser::PasswordResets::Index < BrowserAction
  include Shield::CurrentUser::PasswordResets::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/account/password-resets" do
    html IndexPage, password_resets: password_resets, pages: pages
  end

  private getter paginated_password_resets : Tuple(
    Lucky::Paginator,
    PasswordResetQuery
  ) do
    query = PasswordResetQuery.new.user_id(user.id)
    query = PasswordResetQueryFilter.run(query, params)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
