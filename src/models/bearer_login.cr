class BearerLogin < BaseModel
  include Shield::BearerLogin

  table :bearer_logins { }

  delegate :active?, :inactive?, to: status
end
