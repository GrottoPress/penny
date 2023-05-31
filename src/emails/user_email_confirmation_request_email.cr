class UserEmailConfirmationRequestEmail < BaseEmail
  @email : String

  def initialize(operation : StartEmailConfirmation)
    @email = operation.email.value.to_s
  end

  private def receiver
    Carbon::Address.new(@email)
  end

  private def heading
    Rex.t(
      :"email.user_email_confirmation_request.subject",
      app_name: App.settings.name
    )
  end

  private def text_message : String
    Rex.t(
      :"email.user_email_confirmation_request.body",
      app_name: App.settings.name,
      password_reset_url: PasswordResets::New.url
    )
  end
end
