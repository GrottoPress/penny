module Mixins::SaveUserName
  macro included
    before_save do
      validate_first_name_required
      validate_last_name_required

      validate_first_name_valid
      validate_last_name_valid
    end

    private def validate_first_name_required
      validate_required first_name,
        message: Rex.t(:"operation.error.first_name_required")
    end

    private def validate_last_name_required
      validate_required last_name,
        message: Rex.t(:"operation.error.last_name_required")
    end

    private def validate_first_name_valid
      validate_name first_name,
        message: Rex.t(:"operation.error.first_name_invalid")
    end

    private def validate_last_name_valid
      validate_name last_name,
        message: Rex.t(:"operation.error.last_name_invalid")
    end
  end
end
