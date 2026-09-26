class Login < BaseModel
  include Shield::Login

  table :logins { }

  delegate :active?, :inactive?, to: status
end
