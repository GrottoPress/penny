class EmailConfirmation < BaseModel
  include Shield::EmailConfirmation

  table :email_confirmations { }

  delegate :active?, :failure?, :inactive?, :success?, to: status
end
