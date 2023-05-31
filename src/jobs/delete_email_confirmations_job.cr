struct DeleteEmailConfirmationsJob
  include Mel::Job

  def run
    delete_email_confirmations
  end

  private def delete_email_confirmations
    EmailConfirmationQuery.new
      .inactive_at.is_not_nil
      .inactive_at.lt(App.settings.keep_email_confirmations_for.ago.to_utc)
      .delete
  end
end
