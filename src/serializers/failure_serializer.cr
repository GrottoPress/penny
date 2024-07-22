struct FailureSerializer
  include Mixins::Serializer

  def initialize(
    @errors : Hash(Symbol, Array(String))? = nil,
    @message : String? = nil
  )
  end

  private def status : Status
    Status::Failure
  end

  private def data_json : NamedTuple
    data = previous_def

    @errors.try do |errors|
      data = data.merge({errors: errors}) unless errors.empty?
    end

    data
  end
end
