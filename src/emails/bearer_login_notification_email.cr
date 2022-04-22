class BearerLoginNotificationEmail < BaseEmail
  def initialize(@operation : CreateBearerLogin, @bearer_login : BearerLogin)
  end

  header "Reply-To", App.settings.email_reply_to

  private def receiver
    @bearer_login.user
  end

  private def heading
    Rex.t(
      :"email.bearer_login_notification.subject",
      app_name: App.settings.name
    )
  end

  private def text_message : String
    user = @bearer_login.user

    Rex.t(
      :"email.bearer_login_notification.body",
      app_name: App.settings.name,
      first_name: user.first_name,
      last_name: user.last_name,
      full_name: user.full_name,
      active_time: @bearer_login.active_at.to_s(date_time_format),
      bearer_login_name: @bearer_login.name
    )
  end

  private def date_time_format
    "#{App.settings.date_format}, #{App.settings.time_format}"
  end
end
