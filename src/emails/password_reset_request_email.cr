class PasswordResetRequestEmail < BaseEmail
  def initialize(
    @operation : StartPasswordReset,
    @password_reset : PasswordReset
  )
  end

  private def receiver
    @password_reset.user
  end

  private def heading
    Rex.t(:"email.password_reset_request.subject", app_name: App.settings.name)
  end

  private def text_message : String
    user = @password_reset.user

    Rex.t(
      :"email.password_reset_request.body",
      app_name: App.settings.name,
      first_name: user.first_name,
      last_name: user.last_name,
      full_name: user.full_name,
      link: PasswordResetCredentials.new(@operation, @password_reset).url,
      link_expiry: Shield.settings.password_reset_expiry.total_minutes.to_i
    )
  end
end
