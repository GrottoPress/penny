class UserEmailConfirmationRequestEmail < BaseEmail
  def initialize(@operation : StartEmailConfirmation)
  end

  private def receiver
    Carbon::Address.new(@operation.email.value.to_s)
  end

  private def heading
    "Email confirmation failed"
  end

  private def text_message : String
    <<-TEXT
    Hi,

    You (or someone else) entered this email address while trying to
    register for a new #{App.settings.name} account, or update the email of
    an existing user.

    The attempted action has failed, so there is nothing you should
    worry about.

    If you have lost your password, however, you may reset your password here:

    #{PasswordResets::New.url}

    Regards,
    #{App.settings.name}.
    TEXT
  end
end
