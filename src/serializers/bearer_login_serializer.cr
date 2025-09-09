struct BearerLoginSerializer
  include Mixins::SuccessSerializer

  def initialize(
    @fields : Indexable(String)? = nil,
    @bearer_login : BearerLogin? = nil,
    @bearer_logins : Array(BearerLogin)? = nil,
    @message : String? = nil,
    @pages : Lucky::Paginator? = nil,
    @token : String? = nil,
    @current_user : User? = nil
  )
  end

  def self.item(
    bearer_login : BearerLogin,
    fields : Indexable(String)?,
    current_user : User? = nil
  )
    BearerLoginResponseFilter.run(bearer_login, fields, current_user)
  end

  private def data_json : NamedTuple
    data = previous_def
    data = add_bearer_login(data)
    data = add_bearer_logins(data)
    data = add_token(data)
    data
  end

  private def add_bearer_login(data)
    @bearer_login.try do |bearer_login|
      data = data.merge({
        bearer_login: self.class.item(bearer_login, @fields, @current_user)
      })
    end

    data
  end

  private def add_bearer_logins(data)
    @bearer_logins.try do |bearer_logins|
      data = data.merge({
        bearer_logins: self.class.list(bearer_logins, @fields, @current_user)
      })
    end

    data
  end

  private def add_token(data)
    @token.try { |token| data = data.merge({token: token}) }
    data
  end
end
