class User < BaseModel
  include Shield::User
  include Shield::UserSettingsColumn

  include Shield::HasManyBearerLogins
  include Shield::HasManyEmailConfirmations
  include Shield::HasManyLogins
  include Shield::HasManyPasswordResets

  include Carbon::Emailable

  table :users do
    column first_name : String
    column last_name : String
    column level : UserLevel
  end

  def full_name : String
    Rex.t(:"model.user.full_name", first_name: first_name, last_name: last_name)
  end

  def emailable : Carbon::Address
    Carbon::Address.new(full_name, email)
  end
end
