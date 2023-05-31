struct DeletePasswordResetsJob
  include Mel::Job

  def run
    delete_password_resets
  end

  private def delete_password_resets
    PasswordResetQuery.new
      .inactive_at.is_not_nil
      .inactive_at.lt(App.settings.keep_password_resets_for.ago.to_utc)
      .delete
  end
end
