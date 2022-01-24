class UpdateCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  before_save do
    validate_not_pwned(password) if LuckyEnv.production?
  end

  include SaveUserName
end
