require "mel/worker"

require "./app"

Habitat.raise_if_missing_settings!

exit if LuckyEnv.development?

Mel.redis.multi do |redis|
  DeleteBearerLoginsJob.run_every(
    1.week,
    redis: redis,
    id: "delete-bearer-logins-weekly"
  )

  DeleteEmailConfirmationsJob.run_every(
    1.week,
    redis: redis,
    id: "delete-email-confirmations-weekly"
  )

  DeleteLoginsJob.run_every(
    1.week,
    redis: redis,
    id: "delete-logins-weekly"
  )

  DeletePasswordResetsJob.run_every(
    1.week,
    redis: redis,
    id: "delete-password-resets-weekly"
  )
end

ARGV.first?.try { |worker_id| Mel.settings.worker_id = worker_id.to_i }

Mel.start
