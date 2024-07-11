class PasswordChangeNotificationEmail < BaseEmail
  @user : {
    email: String,
    first_name: String,
    full_name: String,
    last_name: String
  }

  def initialize(operation : User::SaveOperation, user : User)
    @user = {
      email: user.email,
      first_name: user.first_name,
      full_name: user.full_name,
      last_name: user.last_name
    }
  end

  reply_to App.settings.email_reply_to

  private def receiver
    Carbon::Address.new(@user[:full_name], @user[:email])
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
      first_name: @user[:first_name],
      last_name: @user[:last_name],
      full_name: @user[:full_name]
    )
  end
end
