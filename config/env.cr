unless Bool.adapter.parse(ENV["SKIP_LOAD_ENV"]?.to_s).value
  # LuckyEnv.load(".env")

  # This only replaces the `LuckyEnv` loader;
  # You can still use `LuckyEnv` methods.
  Envy.from_file ".env.yml", "/run/secrets/app-env"
end
