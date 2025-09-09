alias UserResponse = Hash(Symbol, Union(
  Bool,
  Int64,
  String,
  UserLevel,
  UserSettings
))

struct UserResponseFilter
  include Mixins::ResponseFilter

  def initialize(@user : User)
  end

  def run(
    fields : Indexable(String)?,
    current_user : User? = nil
  ) : UserResponse
    default_response.tap do |response|
      add_created_at(response, fields, current_user)
      add_email(response, fields, current_user)
      add_level(response, fields, current_user)
      add_name(response, fields)
      add_settings(response, fields, current_user)
      add_updated_at(response, fields, current_user)
    end
  end

  private def add_created_at(response, fields, current_user)
    return unless QueryPattern.match?("user.created_at", fields)

    current_user.try do |user|
      if user.level.editor? || user.id == @user.id
        response[:created_at] = @user.created_at.to_unix
      end
    end
  end

  private def add_email(response, fields, current_user)
    return unless QueryPattern.match?("user.email", fields)

    current_user.try do |user|
      if user.level.editor? || user.id == @user.id
        response[:email] = @user.email
      end
    end
  end

  private def add_level(response, fields, current_user)
    return unless QueryPattern.match?("user.level", fields)

    current_user.try do |user|
      if user.level.admin? || user.id == @user.id
        response[:is_author] = @user.level.author?
        response[:is_admin] = @user.level.admin?
        response[:is_editor] = @user.level.editor?
        response[:level] = @user.level
      end
    end
  end

  private def add_name(response, fields)
    return unless QueryPattern.match?("user.name", fields)

    response[:first_name] = @user.first_name
    response[:full_name] = @user.full_name
    response[:last_name] = @user.last_name
  end

  private def add_settings(response, fields, current_user)
    return unless QueryPattern.match?("user.settings", fields)

    current_user.try do |user|
      if user.level.editor? || user.id == @user.id
        response[:settings] = @user.settings
      end
    end
  end

  private def add_updated_at(response, fields, current_user)
    return unless QueryPattern.match?("user.updated_at", fields)

    current_user.try do |user|
      if user.level.editor? || user.id == @user.id
        response[:updated_at] = @user.updated_at.to_unix
      end
    end
  end

  private def default_response
    UserResponse{:id => @user.id}
  end
end
