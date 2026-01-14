Mel.configure do |settings|
  settings.batch_size = ENV["JOBS_BATCH_SIZE"].to_i
  settings.poll_interval = ENV["JOBS_POLL_INTERVAL"].to_i.seconds
  settings.store = Mel::Redis.new(ENV["REDIS_URL"], :penny)
  settings.timezone = App.settings.timezone

  settings.error_handler = ->(error : Exception) do
    unless LuckyEnv.production?
      return puts <<-TEXT

        === BEGIN Error ===
        #{error.inspect_with_backtrace.chomp}
        === END Error ===

        TEXT
    end

    # WorkerErrorEmail.new(error).deliver
  end
end

if LuckyEnv.test?
  Mel.configure do |settings|
    settings.batch_size = -1
    settings.poll_interval = 1.millisecond
    settings.store = Mel::Redis.new(
      settings.store.as(Mel::Redis).client,
      "penny:spec"
    )
  end
end

if LuckyEnv.production?
  backend = Log::IOBackend.new(formatter: Dexter::JSONLogFormatter.proc)
  Mel.log.dexter.configure(:info, backend)
else
  Mel.log.dexter.configure(:info)
end

unless LuckyEnv.task?
  Mel.start_async if LuckyEnv.development?
end
