struct DeleteLoginsJob
  include Mel::Job

  def run
    delete_logins
  end

  private def delete_logins
    LoginQuery.new
      .inactive_at.is_not_nil
      .inactive_at.lt(App.settings.keep_logins_for.ago.to_utc)
      .delete
  end
end
