struct LoginPreloader
  include Mixins::Preloader

  def run(query : Avram::Queryable, fields : Indexable(String)?) : LoginQuery
    query = preload_user(query, fields)
    query
  end

  def run(record : Avram::Model, fields : Indexable(String)?) : Login
    login = preload_user(record, fields)
    login
  end

  private def preload_user(query : LoginQuery, fields)
    if QueryPattern.match?("user.*", fields)
      query = query.preload_user
    end

    query
  end

  private def preload_user(login : Login, fields)
    if QueryPattern.match?("user.*", fields)
      login = LoginQuery.preload_user(login, force: true)
    end

    login
  end
end
