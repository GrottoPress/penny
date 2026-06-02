class Api::PasswordResets::Index < PublicApi
  include Shield::Api::PasswordResets::Index

  get "/password-resets" do
    json PasswordResetSerializer.new(
      params,
      password_resets: password_resets,
      current_user: current_user?,
      pages: pages
    )
  end

  private getter paginated_password_resets : Tuple(
    Lucky::Paginator,
    PasswordResetQuery
  ) do
    query = PasswordResetQueryFilter.run(params)
    query = PasswordResetQueryLoader.run(query, params)

    paginate(query)
  end
end
