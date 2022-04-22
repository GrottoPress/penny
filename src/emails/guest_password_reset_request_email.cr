class GuestPasswordResetRequestEmail < BaseEmail
  def initialize(@operation : StartPasswordReset)
  end

  private def receiver
    Carbon::Address.new(@operation.email.value.to_s)
  end

  private def heading
    Rex.t(
      :"email.guest_password_reset_request.subject",
      app_name: App.settings.name
    )
  end

  private def text_message : String
    Rex.t(
      :"email.guest_password_reset_request.body",
      app_name: App.settings.name
    )
  end
end
