class UserEmailConfirmationRequestEmail < BaseEmail
  def initialize(@operation : StartEmailConfirmation)
  end

  private def receiver
    Carbon::Address.new(@operation.email.value.to_s)
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
