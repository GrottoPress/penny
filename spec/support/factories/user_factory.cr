class UserFactory < Avram::Factory
  def initialize
    set_defaults
  end

  def password(password : String)
    password_digest BcryptHash.new(password).hash
  end

  private def set_defaults
    first_name "Mary"
    last_name "Smith"
    email "user@domain.tld"
    level UserLevel.new(:author)
    password "password12U~password"
  end
end
