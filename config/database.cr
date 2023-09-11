AppDatabase.configure do |settings|
  settings.credentials = Avram::Credentials.parse(ENV["DATABASE_URL"])
end

if LuckyEnv.test?
  AppDatabase.settings.credentials = Avram::Credentials.new(
    database: "penny_test",
    hostname: AppDatabase.settings.credentials.hostname,
    port: AppDatabase.settings.credentials.port,
    query: AppDatabase.settings.credentials.query,
    username: AppDatabase.settings.credentials.username,
    password: AppDatabase.settings.credentials.password
  )
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  # In production, allow lazy loading (N+1).
  # In development and test, raise an error if you forget to preload associations
  settings.lazy_load_enabled = LuckyEnv.production?

  # Disable query cache during tests
  # settings.query_cache_enabled = !LuckyEnv.test?
end
