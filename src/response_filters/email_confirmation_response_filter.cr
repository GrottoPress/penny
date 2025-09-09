alias EmailConfirmationResponse = Hash(Symbol, Union(
  Bool,
  Int64,
  String,
  UserResponse
))

struct EmailConfirmationResponseFilter
  include Mixins::ResponseFilter

  def initialize(@email_confirmation : EmailConfirmation)
  end

  def run(
    fields : Indexable(String)?,
    current_user : User? = nil
  ) : EmailConfirmationResponse
    default_response.tap do |response|
      add_active_at(response, fields)
      add_email(response, fields)
      add_inactive_at(response, fields)
      add_ip_address(response, fields, current_user)
      add_status(response, fields)
      add_user(response, fields, current_user)
    end
  end

  private def add_active_at(response, fields)
    return unless QueryPattern.match?("email_confirmation.active_at", fields)

    response[:active_at] = @email_confirmation.active_at.to_unix
  end

  private def add_email(response, fields)
    return unless QueryPattern.match?("email_confirmation.email", fields)

    response[:email] = @email_confirmation.email
  end

  private def add_inactive_at(response, fields)
    return unless QueryPattern.match?("email_confirmation.inactive_at", fields)

    @email_confirmation.inactive_at.try do |inactive_at|
      response[:inactive_at] = inactive_at.to_unix
    end
  end

  private def add_ip_address(response, fields, current_user)
    return unless QueryPattern.match?("email_confirmation.ip_address", fields)

    current_user.try do |user|
      if user.level.admin? || user.id == @email_confirmation.user_id
        response[:ip_address] = @email_confirmation.ip_address
      end
    end
  end

  private def add_status(response, fields)
    return unless QueryPattern.match?("email_confirmation.status", fields)

    response[:is_active] = @email_confirmation.status.active?
    response[:is_failure] = @email_confirmation.status.failure?
    response[:is_inactive] = @email_confirmation.status.inactive?
    response[:is_pending] = @email_confirmation.status.pending?
    response[:is_success] = @email_confirmation.status.success?
    response[:is_unactive] = @email_confirmation.status.unactive?
  end

  private def add_user(response, fields, current_user)
    return unless QueryPattern.match?("user.*", fields)

    @email_confirmation.user.try do |user|
      response[:user] = UserResponseFilter.run(user, fields, current_user)
    end
  end

  private def default_response
    EmailConfirmationResponse{
      :id => @email_confirmation.id,
    }.tap do |response|
      @email_confirmation.user_id.try do |user_id|
        response[:user] = UserResponse{:id => user_id}
        response[:user_id] = user_id
      end
    end
  end
end
