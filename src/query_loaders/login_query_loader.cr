struct LoginQueryLoader
  include Mixins::QueryLoader

  def run(query : LoginQuery, fields : Array(String)?) : LoginQuery
    query = preload_user(query, fields)
    query
  end

  def run(login : Login, fields : Array(String)?) : Login
    login = preload_user(login, fields)
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
