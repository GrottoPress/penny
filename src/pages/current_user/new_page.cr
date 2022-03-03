struct CurrentUser::NewPage < AuthLayout
  needs operation : RegisterCurrentUser

  include PageParamKey

  def page_title
    "Register account"
  end

  def content
    h1 "Register Account"

    form_for Create do
      para do
        label "Email", for: "#{param_key}_email"

        input id: "#{param_key}_email",
          type: "text",
          attrs: [:disabled],
          value: operation.email.value.to_s
      end

      para do
        mount Shared::Field, operation.password do |builder|
          builder.password_input
        end
      end

      para do
        mount Shared::Field, operation.first_name
      end

      para do
        mount Shared::Field, operation.last_name
      end

      para do
        mount Shared::Field,
          operation.save_user_options.bearer_login_notify,
          label_text: bearer_login_notify_label_text do |builder|
          builder.checkbox
        end
      end

      para do
        mount Shared::Field,
          operation.save_user_options.login_notify,
          label_text: login_notify_label_text do |builder|
          builder.checkbox
        end
      end

      para do
        mount Shared::Field,
          operation.save_user_options.password_notify,
          label_text: password_notify_label_text do |builder|
          builder.checkbox
        end
      end

      para do
        link "Have an account?", to: CurrentLogin::New
        text " | "
        link "Lost your password?", to: ::PasswordResets::New
      end

      para do
        button "Register", role: "submit"
      end
    end
  end

  private def bearer_login_notify_label_text
    "Send me an email whenever I create a bearer login"
  end

  private def login_notify_label_text
    "Send me an email whenever my account is accessed"
  end

  private def password_notify_label_text
    "Send me an email whenever my password changes"
  end
end
