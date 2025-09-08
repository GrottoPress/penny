struct PasswordResetQueryLoader
  include Mixins::QueryLoader

  def run(
    query : PasswordResetQuery,
    fields : Array(String)?
  ) : PasswordResetQuery
    query = preload_user(query, fields)
    query
  end

  def run(
    password_reset : PasswordReset,
    fields : Array(String)?
  ) : PasswordReset
    password_reset = preload_user(password_reset, fields)
    password_reset
  end

  private def preload_user(query : PasswordResetQuery, fields)
    if QueryPattern.match?("user.*", fields)
      query = query.preload_user
    end

    query
  end

  private def preload_user(password_reset : PasswordReset, fields)
    if QueryPattern.match?("user.*", fields)
      password_reset = PasswordResetQuery.preload_user(
        password_reset,
        force: true
      )
    end

    password_reset
  end
end
