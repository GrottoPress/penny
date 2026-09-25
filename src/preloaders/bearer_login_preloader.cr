struct BearerLoginPreloader
  include Mixins::Preloader

  def run(
    query : Avram::Queryable,
    fields : Indexable(String)?
  ) : BearerLoginQuery
    query = preload_user(query, fields)
    query
  end

  def run(record : Avram::Model, fields : Indexable(String)?) : BearerLogin
    bearer_login = preload_user(record, fields)
    bearer_login
  end

  private def preload_user(query : BearerLoginQuery, fields)
    if QueryPattern.match?("user.*", fields)
      query = query.preload_user
    end

    query
  end

  private def preload_user(bearer_login : BearerLogin, fields)
    if QueryPattern.match?("user.*", fields)
      bearer_login = BearerLoginQuery.preload_user(bearer_login, force: true)
    end

    bearer_login
  end
end
