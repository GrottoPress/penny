class WelcomeEmail < BaseEmail
  def initialize(@operation : RegisterCurrentUser, @user : User)
  end

  reply_to App.settings.email_reply_to

  private def receiver
    @user
  end

  private def heading
    Rex.t(:"email.welcome.subject", app_name: App.settings.name)
  end

  private def text_message : String
    Rex.t(
      :"email.welcome.subject",
      app_name: App.settings.name,
      first_name: @user.first_name,
      last_name: @user.last_name,
      full_name: @user.full_name,
      login_url: CurrentLogin::New.url
    )
  end
end
