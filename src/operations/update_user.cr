class UpdateUser < User::SaveOperation
  permit_columns :first_name, :last_name, :level

  before_save do
    validate_required first_name, last_name, level
    validate_name first_name, last_name
    validate_not_pwned password

    reset_level
  end

  include Shield::UpdateUser
  include Shield::HasOneUpdateSaveUserOptions

  # Ensure current admin cannot change their own level,
  # lest they get locked out
  private def reset_level
    current_login.try do |login|
      level.value = level.original_value if login.user_id == id.value
    end
  end
end
