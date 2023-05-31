class UserWelcomeEmail < BaseEmail
  @email : String

  def initialize(operation : RegisterCurrentUser)
    @email = operation.email.value.to_s
  end

  private def receiver
    Carbon::Address.new(@email)
  end

  private def heading
    Rex.t(:"email.user_welcome.subject", app_name: App.settings.name)
  end

  private def text_message : String
    Rex.t(
      :"email.user_welcome.body",
      app_name: App.settings.name,
      password_reset_url: PasswordResets::New.url
    )
  end
end
