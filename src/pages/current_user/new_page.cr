struct CurrentUser::NewPage < AuthLayout
  needs operation : RegisterCurrentUser

  include Mixins::PageParamKey

  def page_title
    Rex.t(:"page.current_user.new.page_title")
  end

  def content
    h1 Rex.t(:"page.current_user.new.main_title")

    form_for Create do
      para do
        label Rex.t(:"page.current_user.new.form.email.label"),
          for: "#{param_key}_email"

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
        link have_account_text, to: CurrentLogin::New
        text " | "
        link lost_password_text, to: ::PasswordResets::New
      end

      para do
        button Rex.t(:"page.current_user.new.form.submit.label"), role: "submit"
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
