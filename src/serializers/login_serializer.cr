struct LoginSerializer < BaseSerializer
  def initialize(@login : Login)
  end

  def render
    {
      id: @login.id,
      ip_address: @login.ip_address,
      active_at: @login.active_at.to_unix,
      inactive_at: @login.inactive_at.try &.to_unix
    }
  end
end
