struct UserSerializer < BaseSerializer
  def initialize(@user : User)
  end

  def render
    {
      id: @user.id,
      email: @user.email,
      level: @user.level,
      first_name: @user.first_name,
      last_name: @user.last_name,
      created_at: @user.created_at.to_unix,
      updated_at: @user.updated_at.to_unix,
    }
  end
end
