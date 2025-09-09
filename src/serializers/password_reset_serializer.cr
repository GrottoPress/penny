struct PasswordResetSerializer
  include Mixins::SuccessSerializer

  def initialize(
    @fields : Indexable(String)? = nil,
    @password_reset : PasswordReset? = nil,
    @password_resets : Array(PasswordReset)? = nil,
    @message : String? = nil,
    @pages : Lucky::Paginator? = nil,
    @token : String? = nil,
    @current_user : User? = nil
  )
  end

  def self.item(
    password_reset : PasswordReset,
    fields : Indexable(String)?,
    current_user : User? = nil
  )
    PasswordResetResponseFilter.run(password_reset, fields, current_user)
  end

  private def data_json : NamedTuple
    data = previous_def
    data = add_password_reset(data)
    data = add_password_resets(data)
    data = add_token(data)
    data
  end

  private def add_password_reset(data)
    @password_reset.try do |password_reset|
      data = data.merge({
        password_reset: self.class.item(password_reset, @fields, @current_user)
      })
    end

    data
  end

  private def add_password_resets(data)
    @password_resets.try do |password_resets|
      data = data.merge({
        password_resets: self.class.list(password_resets, @fields, @current_user)
      })
    end

    data
  end

  private def add_token(data)
    @token.try { |token| data = data.merge({token: token}) }
    data
  end
end
