require "mel/worker"

require "./app"

exit if LuckyEnv.development?

DeleteBearerLoginsJob.run_every(1.week, id: "delete-bearer-logins-weekly")

DeleteEmailConfirmationsJob.run_every(
  1.week,
  id: "delete-email-confirmations-weekly"
)

DeleteLoginsJob.run_every(1.week, id: "delete-logins-weekly")
DeletePasswordResetsJob.run_every(1.week, id: "delete-password-resets-weekly")

Mel.start
