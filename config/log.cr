require "file_utils"

if LuckyEnv.test?
  # Logs to `tmp/test.log` so you can see what's happening without having
  # a bunch of log output in your spec results.
  FileUtils.mkdir_p("tmp")

  backend = Log::IOBackend.new(File.new("tmp/test.log", mode: "w"))
  Log.dexter.configure(:debug, backend)
elsif LuckyEnv.production?
  # Lucky uses JSON in production so logs can be searched more easily
  #
  # If you want logs like in develpoment use 'Lucky::PrettyLogFormatter.proc'.
  backend = Log::IOBackend.new(formatter: Dexter::JSONLogFormatter.proc)
  Log.dexter.configure(:info, backend)
  DB::Log.level = :none
else
  # Use a pretty formatter printing to STDOUT in development
  backend = Log::IOBackend.new(formatter: Lucky::PrettyLogFormatter.proc)
  Log.dexter.configure(:debug, backend)
  DB::Log.level = :info
end

# Lucky only logs when before/after pipes halt by redirecting, or rendering a
# response. Pipes that run without halting are not logged.
#
# If you want to log every pipe that runs, set the log level to ':info'
Lucky::ContinuedPipeLog.dexter.configure(:none)

# Lucky only logs failed queries by default.
#
# Set the log to ':info' to log all queries
Avram::QueryLog.dexter.configure(:none)

# Skip logging
Lucky::LogHandler.configure do |settings|
  settings.skip_if = ->(context : HTTP::Server::Context) do
    return false unless filter = ENV["SKIP_LOG_REGEX"]?
    !!(Regex.new(filter) =~ context.request.resource)
  end
end
