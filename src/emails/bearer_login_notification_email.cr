class BearerLoginNotificationEmail < BaseEmail
  @bearer_login : {
    active_at: Time,
    name: String,
    user: {
      email: String,
      first_name: String,
      full_name: String,
      last_name: String,
    }
  }

  def initialize(operation : CreateBearerLogin, bearer_login : BearerLogin)
    user = bearer_login.user

    @bearer_login = {
      active_at: bearer_login.active_at,
      name: bearer_login.name,
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
    Carbon::Address.new(
      @bearer_login[:user][:full_name],
      @bearer_login[:user][:email]
    )
  end

  private def heading
    Rex.t(
      :"email.bearer_login_notification.subject",
      app_name: App.settings.name
    )
  end

  private def text_message : String
    Rex.t(
      :"email.bearer_login_notification.body",
      app_name: App.settings.name,
      first_name: @bearer_login[:user][:first_name],
      last_name: @bearer_login[:user][:last_name],
      full_name: @bearer_login[:user][:full_name],
      active_time: Rex.l(@bearer_login[:active_at], :long),
      bearer_login_name: @bearer_login[:name]
    )
  end
end
