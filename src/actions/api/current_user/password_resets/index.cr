class Api::CurrentUser::PasswordResets::Index < PublicApi
  include Shield::Api::CurrentUser::PasswordResets::Index

  param count : Int32 = 12
  param page : Int32 = 1

  get "/account/password-resets" do
    json PasswordResetSerializer.new(
      params,
      password_resets: password_resets,
      current_user: current_user_or_bearer?,
      pages: pages
    )
  end

  private getter paginated_password_resets : Tuple(
    Lucky::Paginator,
    PasswordResetQuery
  ) do
    query = PasswordResetQueryFilter.run(params)
    query = PasswordResetQueryLoader.run(query, params)
    query = query.user_id(user.id)

    paginate(query, per_page: count.clamp(5, 50))
  end
end
