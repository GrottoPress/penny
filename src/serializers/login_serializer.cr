class LoginSerializer < BaseSerializer
  def initialize(@login : Login)
  end

  def render
    {
      id: @login.id,
      ip_address: @login.ip_address,
      started_at: @login.started_at.to_unix,
      ended_at: @login.ended_at.try &.to_unix
    }
  end
end
