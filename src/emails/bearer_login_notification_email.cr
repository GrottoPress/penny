class BearerLoginNotificationEmail < BaseEmail
  def initialize(@operation : CreateBearerLogin, @bearer_login : BearerLogin)
  end

  header "Reply-To", App.settings.email_reply_to

  private def receiver
    @bearer_login.user
  end

  private def heading
    "New bearer login token created"
  end

  private def text_message : String
    <<-TEXT
    Hi #{@bearer_login.user.first_name},

    This is to let you know that a new bearer login token was created for your
    #{App.settings.name} account.

    =====
    Date: #{@bearer_login.active_at.to_s(date_time_format)}
    Name: #{@bearer_login.name}
    =====

    If you did not authorize this, let us know immediately in your reply
    to this message. Otherwise, you may safely ignore this email.

    Regards,
    #{App.settings.name}.
    TEXT
  end

  private def date_time_format
    "#{App.settings.date_format}, #{App.settings.time_format}"
  end
end
