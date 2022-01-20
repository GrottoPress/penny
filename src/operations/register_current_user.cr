class RegisterCurrentUser < User::SaveOperation
  permit_columns :first_name, :last_name

  before_save do
    validate_required first_name, last_name
    validate_name first_name, last_name
    validate_not_pwned(password) if LuckyEnv.production?

    set_level
  end

  include Shield::SendWelcomeEmail

  private def set_level
    if !App.settings.make_first_user_admin || UserQuery.new.first?
      level.value = UserLevel.new(:author)
    else
      level.value = UserLevel.new(:admin)
    end
  end
end
