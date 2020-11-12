# This is used when generating URLs for your application
Lucky::RouteHelper.configure do |settings|
  settings.base_uri = ENV["BASE_URI"]
end
