module Mixins::ValidateUser
  macro included
    before_save do
      validate_first_name_required
      validate_last_name_required
      validate_level_required

      validate_first_name_valid
      validate_last_name_valid

      validate_first_name_length
    end

    private def validate_first_name_required
      validate_required first_name,
        message: Rex.t(:"operation.error.first_name_required")
    end

    private def validate_last_name_required
      validate_required last_name,
        message: Rex.t(:"operation.error.last_name_required")
    end

    private def validate_level_required
      validate_required level, message: Rex.t(:"operation.error.level_required")
    end

    private def validate_first_name_valid
      validate_name first_name,
        message: Rex.t(:"operation.error.first_name_invalid")
    end

    private def validate_last_name_valid
      validate_name last_name,
        message: Rex.t(:"operation.error.last_name_invalid")
    end

    private def validate_first_name_length
      max = 255

      validate_size_of first_name,
        max: max,
        message: Rex.t(:"operation.error.first_name_too_long", max: max)
    end
  end
end
