class Health::Show < BrowserAction
  skip :require_logged_in
  skip :require_logged_out

  get "/up" do
    verify_database_connection
    verify_redis_connection

    head :no_content
  end

  private def verify_database_connection
    Db::VerifyConnection.new(quiet: LuckyEnv.production?).run_task
  end

  private def verify_redis_connection
    Mel.redis.run({"PING"})
  end
end
