struct CurrentUser::EditPage < MainLayout
  needs operation : UpdateCurrentUser

  def page_title
    Rex.t(:"page.current_user.edit.page_title")
  end

  def content
    h1 Rex.t(:"page.current_user.edit.main_title")

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
          operation.bearer_login_notify,
          label_text: bearer_login_notify_label_text do |builder|
          builder.checkbox
        end
      end

      para do
        mount Shared::Field,
          operation.login_notify,
          label_text: login_notify_label_text do |builder|
          builder.checkbox
        end
      end

      para do
        mount Shared::Field,
          operation.password_notify,
          label_text: password_notify_label_text do |builder|
          builder.checkbox
        end
      end

      para do
        link "[x] #{log_out_text}", to: CurrentLogin::Destroy
      end

      para do
        button Rex.t(:"page.current_user.edit.form.submit.label"),
          role: "submit"
      end
    end
  end

  private def bearer_login_notify_label_text
    Rex.t(:"page.current_user.form.bearer_login_notify.label")
  end

  private def login_notify_label_text
    Rex.t(:"page.current_user.form.login_notify.label")
  end

  private def password_notify_label_text
    Rex.t(:"page.current_user.form.password_notify.label")
  end
end
