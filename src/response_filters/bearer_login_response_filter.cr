struct BearerLoginResponseFilter
  include Mixins::ResponseFilter

  def initialize(@bearer_login : BearerLogin)
  end

  def run(fields : Indexable(String)?, current_user : User? = nil) : ApiResponse
    default_response.tap do |response|
      add_active_at(response, fields)
      add_inactive_at(response, fields)
      add_name(response, fields)
      add_scopes(response, fields)
      add_status(response, fields)
      add_user(response, fields, current_user)
    end
  end

  private def add_active_at(response, fields)
    return unless QueryPattern.match?("bearer_login.active_at", fields)

    response[:active_at] = @bearer_login.active_at.to_unix
  end

  private def add_inactive_at(response, fields)
    return unless QueryPattern.match?("bearer_login.inactive_at", fields)

    @bearer_login.inactive_at.try do |inactive_at|
      response[:inactive_at] = inactive_at.to_unix
    end
  end

  private def add_name(response, fields)
    return unless QueryPattern.match?("bearer_login.name", fields)

    response[:name] = @bearer_login.name
  end

  private def add_scopes(response, fields)
    return unless QueryPattern.match?("bearer_login.scopes", fields)

    response[:scopes] = @bearer_login.scopes
  end

  private def add_status(response, fields)
    return unless QueryPattern.match?("bearer_login.status", fields)

    response[:is_active] = @bearer_login.active?
    response[:is_inactive] = @bearer_login.inactive?

    if @bearer_login.active? || @bearer_login.inactive?
      response[:status] = @bearer_login.status.to_s
    end
  end

  private def add_user(response, fields, current_user)
    return unless QueryPattern.match?("user.*", fields)

    response[:user] = UserResponseFilter.run(
      @bearer_login.user,
      fields,
      current_user
    )
  end

  private def default_response
    ApiResponse{
      :id => @bearer_login.id.hexstring,
      :user => ApiResponse{:id => @bearer_login.user_id.hexstring},
      :user_id => @bearer_login.user_id.hexstring,
    }
  end
end
