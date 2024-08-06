require "mel"

require "./app"

Habitat.raise_if_missing_settings!

exit if LuckyEnv.development?

Mel.transaction do |store|
  DeleteBearerLoginsJob.run_every(
    1.week,
    store: store,
    id: "delete-bearer-logins-weekly"
  )

  DeleteEmailConfirmationsJob.run_every(
    1.week,
    store: store,
    id: "delete-email-confirmations-weekly"
  )

  DeleteLoginsJob.run_every(
    1.week,
    store: store,
    id: "delete-logins-weekly"
  )

  DeletePasswordResetsJob.run_every(
    1.week,
    store: store,
    id: "delete-password-resets-weekly"
  )
end

ARGV.first?.try { |worker_id| Mel.settings.worker_id = worker_id.to_i }

Mel.start
