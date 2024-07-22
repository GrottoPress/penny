struct ErrorSerializer
  include Mixins::Serializer

  def initialize(
    @error_message : String,
    @details : String? = nil,
    @message : String? = nil,
    @param : String? = nil
  )
  end

  private def status : Status
    Status::Error
  end

  private def data_json : NamedTuple
    previous_def.merge(error: error_json)
  end

  private def error_json
    {message: @error_message, details: @details, param: @param}
  end
end
