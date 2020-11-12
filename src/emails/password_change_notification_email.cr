class PasswordChangeNotificationEmail < BaseEmail
  def initialize(@operation : User::SaveOperation, @user : User)
  end

  header "Reply-To", App.settings.email_reply_to

  private def receiver
    @user
  end

  private def heading
    "Your password has changed"
  end

  private def text_message : String
    <<-TEXT
    Hi #{@user.first_name},

    This is to let you know that the password for your #{App.settings.name} account has just been changed.

    If you did not authorize this change, let us know immediately in your reply to this message. Otherwise, you may safely ignore this email.

    Regards,
    #{App.settings.name}.
    TEXT
  end
end
