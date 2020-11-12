class PasswordResetRequestEmail < BaseEmail
  def initialize(
    @operation : StartPasswordReset,
    @password_reset : PasswordReset
  )
  end

  private def receiver
    @password_reset.user!
  end

  private def heading
    "Reset your password"
  end

  private def text_message : String
    <<-TEXT
    Hi #{@password_reset.user!.first_name},

    You (or someone else) recently requested to reset the password for your #{App.settings.name} account.

    To proceed with the password reset process, click the link below:

    #{PasswordResetHelper.password_reset_url(@password_reset, @operation)}

    This password reset link will expire in #{Shield.settings.password_reset_expiry.total_minutes.to_i} minutes.

    If you did not request a password reset, ignore this email.

    Regards,
    #{App.settings.name}.
    TEXT
  end
end
