class UpdateCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  before_save do
    validate_required first_name, last_name
    validate_name first_name, last_name
    validate_not_pwned(password) if LuckyEnv.production?
  end
end
