class PasswordResetRequestEmail < BaseEmail
  @password_reset : {
    id: PasswordReset::PrimaryKeyType,
    user: {
      email: String,
      first_name: String,
      full_name: String,
      last_name: String
    }
  }

  @token : String

  def initialize(operation : StartPasswordReset, password_reset : PasswordReset)
    user = password_reset.user

    @password_reset = {
      id: password_reset.id,
      user: {
        email: user.email,
        first_name: user.first_name,
        full_name: user.full_name,
        last_name: user.last_name
      }
    }

    @token = operation.token
  end

  private def receiver
    Carbon::Address.new(
      @password_reset[:user][:full_name],
      @password_reset[:user][:email]
    )
  end

  private def heading
    Rex.t(:"email.password_reset_request.subject", app_name: App.settings.name)
  end

  private def text_message : String
    Rex.t(
      :"email.password_reset_request.body",
      app_name: App.settings.name,
      first_name: @password_reset[:user][:first_name],
      last_name: @password_reset[:user][:last_name],
      full_name: @password_reset[:user][:full_name],
      link: PasswordResetCredentials.url(@token, @password_reset[:id]),
      link_expiry: Shield.settings.password_reset_expiry.total_minutes.to_i
    )
  end
end
