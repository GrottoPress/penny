struct EmailConfirmationSerializer
  include Mixins::SuccessSerializer

  def initialize(
    @email_confirmation : EmailConfirmation? = nil,
    @email_confirmations : Array(EmailConfirmation)? = nil,
    @message : String? = nil,
    @pages : Lucky::Paginator? = nil,
    @token : String? = nil,
    @user : User? = nil,
  )
  end

  def self.item(email_confirmation : EmailConfirmation)
    {
      active_at: email_confirmation.active_at.to_unix,
      email: email_confirmation.email,
      id: email_confirmation.id,
      inactive_at: email_confirmation.inactive_at.try &.to_unix,
      ip_address: email_confirmation.ip_address,
      status: email_confirmation.status.to_s,
      user_id: email_confirmation.user_id
    }
  end

  private def data_json : NamedTuple
    data = previous_def
    data = add_email_confirmation(data)
    data = add_email_confirmations(data)
    data = add_token(data)
    data = add_user(data)
    data
  end

  private def add_email_confirmation(data)
    @email_confirmation.try do |email_confirmation|
      data = data.merge({
        email_confirmation: self.class.item(email_confirmation)
      })
    end

    data
  end

  private def add_email_confirmations(data)
    @email_confirmations.try do |email_confirmations|
      data = data.merge({
        email_confirmations: self.class.list(email_confirmations)
      })
    end

    data
  end

  private def add_token(data)
    @token.try { |token| data = data.merge({token: token }) }
    data
  end

  private def add_user(data)
    @user.try { |user| data = data.merge({user: UserSerializer.item(user) }) }
    data
  end
end
