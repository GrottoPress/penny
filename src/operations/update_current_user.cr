class UpdateCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  include ValidateNotPwned
  include SaveUserName
end
