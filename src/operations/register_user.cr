class RegisterUser < User::SaveOperation
  permit_columns :first_name, :last_name, :level

  before_save do
    validate_required level
  end

  include Mixins::ValidateUser
  include Mixins::ValidateNotPwned
end
