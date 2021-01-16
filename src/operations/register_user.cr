class RegisterUser < User::SaveOperation
  permit_columns :first_name, :last_name, :level

  before_save do
    validate_required first_name, last_name, level
    validate_name first_name, last_name
    validate_not_pwned(password) if Lucky::Env.production?
  end
end
