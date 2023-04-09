struct Users::EditPage < MainLayout
  needs operation : UpdateUser

  def page_title
    Rex.t(:"page.user.edit.page_title")
  end

  def content
    h1 Rex.t(:"page.user.edit.main_title")

    form_for Update.with(user_id: operation.id.value.not_nil!) do
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

      unless operation.current_login.try &.user_id == operation.id.value
        para do
          mount Shared::Field, operation.level do |builder|
            builder.select_input do
              select_prompt("--")
              builder.options_for_select(select_options: options_for_levels)
            end
          end
        end
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
        button Rex.t(:"page.user.edit.form.submit.label"), role: "submit"
      end
    end
  end

  private def bearer_login_notify_label_text
    Rex.t(:"page.user.form.bearer_login_notify.label")
  end

  private def login_notify_label_text
    Rex.t(:"page.user.form.login_notify.label")
  end

  private def password_notify_label_text
    Rex.t(:"page.user.form.password_notify.label")
  end

  private def options_for_levels
    UserLevel.raw.names.map { |name| {name, UserLevel.new(name)} }
  end
end
