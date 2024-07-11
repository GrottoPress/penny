class EmailConfirmationRequestEmail < BaseEmail
  @email_confirmation : {
    email: String,
    id: EmailConfirmation::PrimaryKeyType,
  }

  @token : String

  def initialize(
    operation : StartEmailConfirmation,
    email_confirmation : EmailConfirmation
  )
    @email_confirmation = {
      email: email_confirmation.email,
      id: email_confirmation.id
    }

    @token = operation.token
  end

  private def receiver
    Carbon::Address.new(@email_confirmation[:email])
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
      link: EmailConfirmationCredentials.url(
        @token,
        @email_confirmation[:id]
      ),
      link_expiry: Shield.settings.email_confirmation_expiry.total_minutes.to_i,
    )
  end
end
