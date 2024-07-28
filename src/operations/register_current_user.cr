class RegisterCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  before_save do
    set_level
  end

  include Mixins::ValidateUser
  include Mixins::ValidateNotPwned
  include Shield::SendWelcomeEmail

  private def set_level
    if App.settings.make_first_user_admin && UserQuery.new.none?
      level.value = UserLevel.new(:admin)
    else
      level.value = UserLevel.new(:author)
    end
  end
end
