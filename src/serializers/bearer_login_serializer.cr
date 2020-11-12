class BearerLoginSerializer < BaseSerializer
  def initialize(@bearer_login : BearerLogin)
  end

  def render
    {
      id: @bearer_login.id,
      name: @bearer_login.name,
      scopes: @bearer_login.scopes,
      started_at: @bearer_login.started_at.to_unix,
      ended_at: @bearer_login.ended_at.try &.to_unix
    }
  end
end
