class BearerLoginSerializer < BaseSerializer
  def initialize(@bearer_login : BearerLogin)
  end

  def render
    {
      id: @bearer_login.id,
      name: @bearer_login.name,
      scopes: @bearer_login.scopes,
      active_at: @bearer_login.active_at.to_unix,
      inactive_at: @bearer_login.inactive_at.try &.to_unix
    }
  end
end
