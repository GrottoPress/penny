require "mel/worker"

Mel.configure do |settings|
  settings.batch_size = ENV["JOBS_BATCH_SIZE"].to_i

  settings.error_handler = ->(error : Exception) do
    # if LuckyEnv.production?
    #   WorkerErrorEmail.new(error).deliver
    # else
    #   puts
    #   puts "===== ERROR ====="
    #   puts "#{error.inspect_with_backtrace}"
    #   puts "===== ERROR ====="
    #   puts
    # end
  end

  settings.poll_interval = Time::Span.new(
    seconds: ENV["JOBS_POLL_INTERVAL"].to_i
  )

  settings.redis_url = ENV["REDIS_URL"]
  # settings.redis_key_prefix = "myapp"
  settings.timezone = App.settings.timezone
  settings.worker_id = ENV["WORKER_ID"].to_i
end

if LuckyEnv.production?
  backend = Log::IOBackend.new(formatter: Dexter::JSONLogFormatter.proc)
  Mel.log.dexter.configure(:info, backend)
  Redis::Connection::LOG.level = :none
else
  Mel.log.dexter.configure(:info)
  Redis::Connection::LOG.level = :info
end

Mel.start_async if LuckyEnv.development?
