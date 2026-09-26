class PasswordReset < BaseModel
  include Shield::PasswordReset

  table :password_resets { }

  delegate :active?, :failure?, :inactive?, :success?, to: status
end
