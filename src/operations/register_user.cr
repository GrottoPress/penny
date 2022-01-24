class RegisterUser < User::SaveOperation
  permit_columns :first_name, :last_name, :level

  before_save do
    validate_required level
    validate_not_pwned(password) if LuckyEnv.production?
  end

  include SaveUserName
end
