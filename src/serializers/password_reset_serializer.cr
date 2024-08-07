struct PasswordResetSerializer
  include Mixins::SuccessSerializer

  def initialize(
    @password_reset : PasswordReset? = nil,
    @password_resets : Array(PasswordReset)? = nil,
    @message : String? = nil,
    @pages : Lucky::Paginator? = nil,
    @token : String? = nil,
    @user : User? = nil,
  )
  end

  def self.item(password_reset : PasswordReset)
    {
      active_at: password_reset.active_at.to_unix,
      id: password_reset.id,
      inactive_at: password_reset.inactive_at.try &.to_unix,
      ip_address: password_reset.ip_address,
      status: password_reset.status.to_s,
      user_id: password_reset.user_id
    }
  end

  private def data_json : NamedTuple
    data = previous_def
    data = add_password_reset(data)
    data = add_password_resets(data)
    data = add_token(data)
    data = add_user(data)
    data
  end

  private def add_password_reset(data)
    @password_reset.try do |password_reset|
      data = data.merge({password_reset: self.class.item(password_reset)})
    end

    data
  end

  private def add_password_resets(data)
    @password_resets.try do |password_resets|
      data = data.merge({password_resets: self.class.list(password_resets)})
    end

    data
  end

  private def add_token(data)
    @token.try { |token| data = data.merge({token: token }) }
    data
  end

  private def add_user(data)
    @user.try { |user| data = data.merge({user: UserSerializer.item(user)}) }
    data
  end
end
