class UpdateUser < User::SaveOperation
  permit_columns :first_name, :last_name, :level

  before_save do
    validate_required level

    reset_level
  end

  include ValidateNotPwned
  include SaveUserName

  # Ensure current admin cannot change their own level,
  # lest they get locked out
  private def reset_level
    current_login.try do |login|
      level.value = level.original_value if login.user_id == id.value
    end
  end
end
