class LoginNotificationEmail < BaseEmail
  @login : {
    active_at: Time,
    ip_address: String,
    user: {
      email: String,
      first_name: String,
      full_name: String,
      last_name: String
    }
  }

  def initialize(operation : StartCurrentLogin, login : Login)
    user = login.user

    @login = {
      active_at: login.active_at,
      ip_address: login.ip_address,
      user: {
        email: user.email,
        first_name: user.first_name,
        full_name: user.full_name,
        last_name: user.last_name
      }
    }
  end

  reply_to App.settings.email_reply_to

  private def receiver
    Carbon::Address.new(@login[:user][:full_name], @login[:user][:email])
  end

  private def heading
    Rex.t(:"email.login_notification.subject", app_name: App.settings.name)
  end

  private def text_message : String
    Rex.t(
      :"email.login_notification.body",
      app_name: App.settings.name,
      first_name: @login[:user][:first_name],
      last_name: @login[:user][:last_name],
      full_name: @login[:user][:full_name],
      login_time: Rex.l(@login[:active_at], :long),
      ip_address: @login[:ip_address]
    )
  end
end
