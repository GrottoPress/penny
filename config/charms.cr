module Redis
  class Connection
    def multi(retries = 5, &)
      previous_def { |transaction| yield transaction }
    rescue error : IO::Error
      # Triggers a retry
      raise DB::PoolResourceLost.new(self, cause: error)
    end
  end
end
