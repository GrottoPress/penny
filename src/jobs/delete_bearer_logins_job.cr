struct DeleteBearerLoginsJob
  include Mel::Job

  def run
    delete_bearer_logins
  end

  private def delete_bearer_logins
    BearerLoginQuery.new
      .inactive_at.is_not_nil
      .inactive_at.lt(App.settings.keep_bearer_logins_for.ago.to_utc)
      .delete
  end
end
