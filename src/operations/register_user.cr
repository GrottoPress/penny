class RegisterUser < User::SaveOperation
  permit_columns :first_name, :last_name, :level

  include Mixins::ValidateUser
  include Mixins::ValidateNotPwned
end
