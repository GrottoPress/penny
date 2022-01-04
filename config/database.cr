AppDatabase.configure do |settings|
  settings.credentials = Avram::Credentials.new(
    database: ENV["DATABASE_NAME"],
    hostname: ENV["DATABASE_HOST"],
    port: ENV["DATABASE_PORT"].to_i,
    username: ENV["DATABASE_USERNAME"],
    password: ENV["DATABASE_PASSWORD"]
  )
end

ENV["DATABASE_URL"] = AppDatabase.settings.credentials.url

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  # In production, allow lazy loading (N+1).
  # In development and test, raise an error if you forget to preload associations
  settings.lazy_load_enabled = LuckyEnv.production?

  # Disable query cache during tests
  # settings.query_cache_enabled = !LuckyEnv.test?
end
