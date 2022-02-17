struct CurrentUser::EditPage < MainLayout
  needs operation : UpdateCurrentUser

  def page_title
    "Edit account"
  end

  def content
    h1 "Edit Account"

    form_for Update do
      para do
        mount Shared::Field, operation.email
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
        link "[x] log out", to: CurrentLogin::Destroy
      end

      para do
        button "Update account", role: "submit"
      end
    end
  end

  private def bearer_login_notify_label_text
    "Send me an email whenever I create a new bearer login"
  end

  private def login_notify_label_text
    "Send me an email whenever my account is accessed"
  end

  private def password_notify_label_text
    "Send me an email whenever my password changes"
  end
end
