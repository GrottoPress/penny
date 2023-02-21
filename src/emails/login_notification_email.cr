class LoginNotificationEmail < BaseEmail
  def initialize(@operation : StartCurrentLogin, @login : Login)
  end

  reply_to App.settings.email_reply_to

  private def receiver
    @login.user
  end

  private def heading
    Rex.t(:"email.login_notification.subject", app_name: App.settings.name)
  end

  private def text_message : String
    user = @login.user

    Rex.t(
      :"email.login_notification.body",
      app_name: App.settings.name,
      first_name: user.first_name,
      last_name: user.last_name,
      full_name: user.full_name,
      login_time: @login.active_at.to_s(date_time_format),
      ip_address: @login.ip_address
    )
  end

  private def date_time_format
    "#{App.settings.date_format}, #{App.settings.time_format}"
  end
end
