struct LoginSerializer
  include Mixins::SuccessSerializer

  def initialize(
    @fields : Indexable(String)? = nil,
    @login : Login? = nil,
    @logins : Array(Login)? = nil,
    @message : String? = nil,
    @pages : Lucky::Paginator? = nil,
    @token : String? = nil,
    @current_user : User? = nil
  )
  end

  def self.item(
    login : Login,
    fields : Indexable(String)?,
    current_user : User? = nil
  )
    LoginResponseFilter.run(login, fields, current_user)
  end

  private def data_json : NamedTuple
    data = previous_def
    data = add_login(data)
    data = add_logins(data)
    data = add_token(data)
    data
  end

  private def add_login(data)
    @login.try do |login|
      data = data.merge({login: self.class.item(login, @fields, @current_user)})
    end

    data
  end

  private def add_logins(data)
    @logins.try do |logins|
      data = data.merge({
        logins: self.class.list(logins, @fields, @current_user)
      })
    end

    data
  end

  private def add_token(data)
    @token.try { |token| data = data.merge({token: token}) }
    data
  end
end
