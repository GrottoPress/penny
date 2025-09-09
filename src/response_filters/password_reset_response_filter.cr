alias PasswordResetResponse = Hash(Symbol, Union(
  Bool,
  Int64,
  String,
  UserResponse
))

struct PasswordResetResponseFilter
  include Mixins::ResponseFilter

  def initialize(@password_reset : PasswordReset)
  end

  def run(
    fields : Indexable(String)?,
    current_user : User? = nil
  ) : PasswordResetResponse
    default_response.tap do |response|
      add_active_at(response, fields)
      add_inactive_at(response, fields)
      add_ip_address(response, fields, current_user)
      add_status(response, fields)
      add_user(response, fields, current_user)
    end
  end

  private def add_active_at(response, fields)
    return unless QueryPattern.match?("password_reset.active_at", fields)

    response[:active_at] = @password_reset.active_at.to_unix
  end

  private def add_inactive_at(response, fields)
    return unless QueryPattern.match?("password_reset.inactive_at", fields)

    @password_reset.inactive_at.try do |inactive_at|
      response[:inactive_at] = inactive_at.to_unix
    end
  end

  private def add_ip_address(response, fields, current_user)
    return unless QueryPattern.match?("password_reset.ip_address", fields)

    current_user.try do |user|
      if user.level.admin? || user.id == @password_reset.user_id
        response[:ip_address] = @password_reset.ip_address
      end
    end
  end

  private def add_status(response, fields)
    return unless QueryPattern.match?("password_reset.status", fields)

    response[:is_active] = @password_reset.status.active?
    response[:is_failure] = @password_reset.status.failure?
    response[:is_inactive] = @password_reset.status.inactive?
    response[:is_pending] = @password_reset.status.pending?
    response[:is_success] = @password_reset.status.success?
    response[:is_unactive] = @password_reset.status.unactive?
  end

  private def add_user(response, fields, current_user)
    return unless QueryPattern.match?("user.*", fields)

    response[:user] = UserResponseFilter.run(
      @password_reset.user,
      fields,
      current_user
    )
  end

  private def default_response
    PasswordResetResponse{
      :id => @password_reset.id,
      :user => UserResponse{:id => @password_reset.user_id},
      :user_id => @password_reset.user_id,
    }
  end
end
