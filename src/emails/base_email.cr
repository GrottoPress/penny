abstract class BaseEmail < Carbon::Email
  from sender
  to receiver
  subject heading

  def sender
    Carbon::Address.new(App.settings.name, App.settings.email_from)
  end

  def text_body
    text_message
  end
end
