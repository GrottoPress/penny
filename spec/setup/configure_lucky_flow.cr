LuckyFlow.configure do |settings|
  settings.stop_retrying_after = 200.milliseconds
  settings.base_uri = Lucky::RouteHelper.settings.base_uri
  settings.driver = LuckyFlow::Drivers::Chrome
end

Spec.before_each { LuckyFlow::Server::INSTANCE.reset }
