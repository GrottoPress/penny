# This is used when generating URLs for your application
Lucky::RouteHelper.configure do |settings|
  settings.base_uri = App.settings.url
end
