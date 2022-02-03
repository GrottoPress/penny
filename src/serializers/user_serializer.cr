struct UserSerializer < BaseSerializer
  def initialize(@user : User)
  end

  def render
    {
      id: @user.id,
      email: @user.email,
      level: @user.level,
      first_name: @user.first_name,
      last_name: @user.last_name
    }
  end
end
