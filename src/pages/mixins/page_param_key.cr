module PageParamKey
  macro included
    private def param_key
      operation.class.param_key
    end
  end
end
