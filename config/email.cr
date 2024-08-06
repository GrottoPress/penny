require "lucille/spec"

BaseEmail.configure do |settings|
  if LuckyEnv.production?
    settings.adapter = Halo::Adapter.new(
      App.settings.email_from,
      ENV["SMTP_PASSWORD"],
      ENV["SMTP_HOST"],
      ENV["SMTP_PORT"].to_i
    )

    settings.deliver_later_strategy = Mel::Carbon::DeliverLater.new
  else
    settings.adapter = Carbon::DevAdapter.new
    settings.deliver_later_strategy = DevDeliverLaterStrategy.new
  end
end
