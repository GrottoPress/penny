class RegisterCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  before_save do
    set_level
  end

  include Mixins::ValidateUser
  include Mixins::ValidateNotPwned
  include Shield::SendWelcomeEmail

  # Makes first user admin
  private def set_level
    if UserQuery.new.none?
      level.value = UserLevel.new(:admin)
    else
      level.value = UserLevel.new(:author)
    end
  end
end
