struct EmailConfirmationSerializer < BaseSerializer
  def initialize(@email_confirmation : EmailConfirmation)
  end

  def render
    {
      id: @email_confirmation.id,
      user_id: @email_confirmation.user_id,
      email: @email_confirmation.email,
      ip_address: @email_confirmation.ip_address,
      active_at: @email_confirmation.active_at.to_unix,
      inactive_at: @email_confirmation.inactive_at.try &.to_unix
    }
  end
end
