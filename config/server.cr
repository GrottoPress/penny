# Here is where you configure the Lucky server
#
# Look at config/route_helper.cr if you want to change the domain used when
# generating links with `Action.url`.
Lucky::Server.configure do |settings|
  # if LuckyEnv.production?
    settings.secret_key_base = secret_key_from_env
    settings.host = ENV["SERVER_HOST"]
    settings.port = ENV["SERVER_PORT"].to_i

    settings.gzip_enabled = Bool.adapter.parse!(ENV["GZIP_ENABLED"])

    # By default certain content types will be gzipped.
    # For a full list look in
    # https://github.com/luckyframework/lucky/blob/master/src/lucky/server.cr
    # To add additional extensions do something like this:
    # config.gzip_content_types << "content/type"
  # else
  #   settings.secret_key_base = "XeqAgSy5QQ+dWe8ruOBUMrz9XPbPZ7chPVtz2ecDGss="
  #   # Change host/port in config/watch.yml
  #   # Alternatively, you can set the DEV_PORT env to set the port for local development
  #   settings.host = Lucky::ServerSettings.host
  #   settings.port = Lucky::ServerSettings.port
  # end
end

Lucky::ForceSSLHandler.configure do |settings|
  # To force SSL in production, uncomment the lines below.
  # This will cause http requests to be redirected to https:
  #
  #    settings.enabled = LuckyEnv.production?
  #    settings.strict_transport_security = {max_age: 1.year, include_subdomains: true}
  settings.enabled = Bool.adapter.parse!(ENV["SSL_ENABLED"])
end

Lucky::RequestIdHandler.configure do |settings|
  settings.set_request_id = ->(context : HTTP::Server::Context) do
    UUID.random.to_s.tap { |id| RequestIdHeader.new(context).set(id) }
  end
end

Lucky::MaximumRequestSizeHandler.configure do |settings|
  settings.enabled = true
  settings.max_size = 10_000_000
end

private def secret_key_from_env
  ENV["SECRET_KEY_BASE"]? || raise_missing_secret_key
end

private def raise_missing_secret_key
  puts "Please set the SECRET_KEY_BASE environment variable. \
    You can generate a secret key with 'lucky gen.secret_key'".colorize.red

  exit(1)
end
