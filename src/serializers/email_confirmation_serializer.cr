struct EmailConfirmationSerializer
  include Mixins::SuccessSerializer

  def initialize(
    @fields : Indexable(String)? = nil,
    @email_confirmation : EmailConfirmation? = nil,
    @email_confirmations : Array(EmailConfirmation)? = nil,
    @message : String? = nil,
    @pages : Lucky::Paginator? = nil,
    @token : String? = nil,
    @current_user : User? = nil
  )
  end

  def self.item(
    email_confirmation : EmailConfirmation,
    fields : Indexable(String)?,
    current_user : User? = nil
  )
    EmailConfirmationResponseFilter.run(
      email_confirmation,
      fields,
      current_user
    )
  end

  private def data_json : NamedTuple
    data = previous_def
    data = add_email_confirmation(data)
    data = add_email_confirmations(data)
    data = add_token(data)
    data
  end

  private def add_email_confirmation(data)
    @email_confirmation.try do |email_confirmation|
      data = data.merge({
        email_confirmation: self.class.item(
          email_confirmation,
          @fields,
          @current_user
        )}
      )
    end

    data
  end

  private def add_email_confirmations(data)
    @email_confirmations.try do |email_confirmations|
      data = data.merge({
        email_confirmations: self.class.list(
          email_confirmations,
          @fields,
          @current_user
        )
      })
    end

    data
  end

  private def add_token(data)
    @token.try { |token| data = data.merge({token: token}) }
    data
  end
end
