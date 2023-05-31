class EmailConfirmationRequestEmail < BaseEmail
  @token : String

  def initialize(
    operation : StartEmailConfirmation,
    @email_confirmation : EmailConfirmation
  )
    @token = operation.token
  end

  private def receiver
    Carbon::Address.new(@email_confirmation.email)
  end

  private def heading
    Rex.t(
      :"email.email_confirmation_request.subject",
      app_name: App.settings.name
    )
  end

  private def text_message : String
    Rex.t(
      :"email.email_confirmation_request.body",
      app_name: App.settings.name,
      link: EmailConfirmationCredentials.new(
        @token,
        @email_confirmation.id
      ).url,
      link_expiry: Shield.settings.email_confirmation_expiry.total_minutes.to_i,
    )
  end
end
