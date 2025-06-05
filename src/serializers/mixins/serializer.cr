module Mixins::Serializer
  enum Status
    Success
    Failure
  end

  private abstract def status : Status

  macro included
    include Lucky::Serializable

    @message : String?

    def render : NamedTuple
      json = {status: status}
      @message.try { |message| json = json.merge({message: message}) }
      data_json.empty? ? json : json.merge({data: data_json})
    end

    private def data_json : NamedTuple
      NamedTuple.new
    end
  end
end
