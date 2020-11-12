class GuestPasswordResetRequestEmail < BaseEmail
  def initialize(@operation : StartPasswordReset)
  end

  private def receiver
    Carbon::Address.new(@operation.email.value.to_s)
  end

  private def heading
    "Password reset failed"
  end

  private def text_message : String
    <<-TEXT
    Hi,

    You (or someone else) entered this email address while trying to change the password of a #{App.settings.name} account.

    However, this email address is not in our database. Therefore, the attempted password change has failed.

    If you are a #{App.settings.name} user and were expecting this email, you may try again using the email address you gave when you registered your account.

    If you are not a #{App.settings.name} user, ignore this email.

    Regards,
    #{App.settings.name}.
    TEXT
  end
end
