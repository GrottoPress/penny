module ValidateNotPwned
  macro included
    before_save do
      validate_not_pwned
    end

    private def validate_not_pwned
      return unless LuckyEnv.production? && password.changed?
      validate_not_pwned(password)
    end
  end
end
