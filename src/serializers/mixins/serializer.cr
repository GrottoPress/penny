module Mixins::Serializer
  enum Status
    Success
    Failure
    Error
  end

  private abstract def status : Status

  macro included
    include Lucille::Serializer

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
