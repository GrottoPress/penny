alias LoginResponse = Hash(Symbol, Union(
  Bool,
  Int64,
  String,
  UserResponse
))

struct LoginResponseFilter
  include Mixins::ResponseFilter

  def initialize(@login : Login)
  end

  def run(
    fields : Indexable(String)?,
    current_user : User? = nil
  ) : LoginResponse
    default_response.tap do |response|
      add_active_at(response, fields)
      add_inactive_at(response, fields)
      add_ip_address(response, fields, current_user)
      add_status(response, fields)
      add_user(response, fields, current_user)
    end
  end

  private def add_active_at(response, fields)
    return unless QueryPattern.match?("login.active_at", fields)

    response[:active_at] = @login.active_at.to_unix
  end

  private def add_inactive_at(response, fields)
    return unless QueryPattern.match?("login.inactive_at", fields)

    @login.inactive_at.try do |inactive_at|
      response[:inactive_at] = inactive_at.to_unix
    end
  end

  private def add_ip_address(response, fields, current_user)
    return unless QueryPattern.match?("login.ip_address", fields)

    current_user.try do |user|
      if user.level.admin? || user.id == @login.user_id
        response[:ip_address] = @login.ip_address
      end
    end
  end

  private def add_status(response, fields)
    return unless QueryPattern.match?("login.status", fields)

    response[:is_active] = @login.status.active?
    response[:is_inactive] = @login.status.inactive?
    response[:is_pending] = @login.status.pending?
    response[:is_unactive] = @login.status.unactive?
    response[:status] = @login.status.to_s
  end

  private def add_user(response, fields, current_user)
    return unless QueryPattern.match?("user.*", fields)

    response[:user] = UserResponseFilter.run(@login.user, fields, current_user)
  end

  private def default_response
    LoginResponse{
      :id => @login.id,
      :user => UserResponse{:id => @login.user_id},
      :user_id => @login.user_id,
    }
  end
end
