class WelcomeEmail < BaseEmail
  def initialize(@operation : RegisterCurrentUser, @user : User)
  end

  header "Reply-To", App.settings.email_reply_to

  private def receiver
    @user
  end

  private def heading
    "Welcome to #{App.settings.name}"
  end

  private def text_message : String
    <<-TEXT
    Hi #{@user.first_name},

    You have successfully completed your registration for your #{App.settings.name} account.

    To access your account, log in via the following link:

    #{CurrentLogin::New.url}

    If you did not register this account, kindly reply to let us know.

    Regards,
    #{App.settings.name}.
    TEXT
  end
end
