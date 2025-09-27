class Worker::Start < LuckyTask::Task
  summary "Start worker"

  def call
    migrate_database
    add_required_data
    start_worker
  end

  private def add_required_data
    Db::Seed::RequiredData.new.call
  end

  private def migrate_database
    Db::Migrate.new.call
  end

  private def start_worker
    Mel.transaction do |store|
      delete_bearer_logins(store)
      delete_email_confirmations(store)
      delete_logins(store)
      delete_password_resets(store)
    end

    Mel.start
  end

  private def delete_bearer_logins(store)
    DeleteBearerLoginsJob.run_every(
      1.week,
      store: store,
      id: "delete-bearer-logins-weekly"
    )
  end

  private def delete_email_confirmations(store)
    DeleteEmailConfirmationsJob.run_every(
      1.week,
      store: store,
      id: "delete-email-confirmations-weekly"
    )
  end

  private def delete_logins(store)
    DeleteLoginsJob.run_every(1.week, store: store, id: "delete-logins-weekly")
  end

  private def delete_password_resets(store)
    DeletePasswordResetsJob.run_every(
      1.week,
      store: store,
      id: "delete-password-resets-weekly"
    )
  end
end
