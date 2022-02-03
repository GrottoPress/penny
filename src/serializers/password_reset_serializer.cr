struct PasswordResetSerializer < BaseSerializer
  def initialize(@password_reset : PasswordReset)
  end

  def render
    {
      id: @password_reset.id,
      user_id: @password_reset.user_id,
      ip_address: @password_reset.ip_address,
      active_at: @password_reset.active_at.to_unix,
      inactive_at: @password_reset.inactive_at.try &.to_unix
    }
  end
end
