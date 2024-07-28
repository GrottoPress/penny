class UpdateCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  include Mixins::ValidateUser
  include Mixins::ValidateNotPwned
end
