class App::Start < LuckyTask::Task
  summary "Start app"

  def call
    migrate_database
    add_required_data
    start_server
  end

  private def add_required_data
    Db::Seed::RequiredData.new.call
  end

  private def migrate_database
    Db::Migrate.new.call
  end

  private def start_server
    run_handlers(server = AppServer.new)
    server.listen
  end

  private def run_handlers(server)
    {Signal::INT, Signal::TERM}.each &.trap { server.close rescue nil }
    at_exit { server.close rescue nil }
  end
end
