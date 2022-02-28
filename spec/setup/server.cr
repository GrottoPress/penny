app_server = AppServer.new

spawn { app_server.listen }

Spec.after_suite do
  LuckyFlow.shutdown
  app_server.close
end
