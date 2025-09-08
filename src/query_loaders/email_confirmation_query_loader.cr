struct EmailConfirmationQueryLoader
  include Mixins::QueryLoader

  def run(
    query : EmailConfirmationQuery,
    fields : Array(String)?
  ) : EmailConfirmationQuery
    query = preload_user(query, fields)
    query
  end

  def run(
    email_confirmation : EmailConfirmation,
    fields : Array(String)?
  ) : EmailConfirmation
    email_confirmation = preload_user(email_confirmation, fields)
    email_confirmation
  end

  private def preload_user(query : EmailConfirmationQuery, fields)
    if QueryPattern.match?("user.*", fields)
      query = query.preload_user
    end

    query
  end

  private def preload_user(email_confirmation : EmailConfirmation, fields)
    if QueryPattern.match?("user.*", fields)
      email_confirmation = EmailConfirmationQuery.preload_user(
        email_confirmation,
        force: true
      )
    end

    email_confirmation
  end
end
