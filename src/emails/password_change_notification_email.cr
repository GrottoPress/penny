class PasswordChangeNotificationEmail < BaseEmail
  def initialize(@operation : User::SaveOperation, @user : User)
  end

  header "Reply-To", App.settings.email_reply_to

  private def receiver
    @user
  end

  private def heading
    Rex.t(
      :"email.password_change_notification.subject",
      app_name: App.settings.name
    )
  end

  private def text_message : String
    Rex.t(
      :"email.password_change_notification.body",
      app_name: App.settings.name,
      first_name: @user.first_name,
      last_name: @user.last_name,
      full_name: @user.full_name
    )
  end
end
