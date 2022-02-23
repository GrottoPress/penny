class LoginNotificationEmail < BaseEmail
  def initialize(@operation : StartCurrentLogin, @login : Login)
  end

  header "Reply-To", App.settings.email_reply_to

  private def receiver
    @login.user
  end

  private def heading
    "Successful login"
  end

  private def text_message : String
    <<-TEXT
    Hi #{@login.user.first_name},

    This is to let you know that your #{App.settings.name} account has just been
    accessed.

    =====
    Date: #{@login.active_at.to_s(date_time_format)}
    IP Address: #{@login.ip_address}
    =====

    If this was not you, let us know immediately in your reply to this message.
    Otherwise, you may safely ignore this email.

    Regards,
    #{App.settings.name}.
    TEXT
  end

  private def date_time_format
    "#{App.settings.date_format}, #{App.settings.time_format}"
  end
end
