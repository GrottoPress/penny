class Users::EditPage < MainLayout
  needs operation : UpdateUser

  def page_title
    "Edit user"
  end

  def content
    h1 "Edit User"

    form_for Update.with(user_id: operation.id.value!) do
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
        button "Update user", role: "submit"
      end
    end
  end

  private def login_notify_label_text
    label_text = "Send user an email whenever their account is accessed"
  end

  private def password_notify_label_text
    label_text = "Send user an email whenever their password changes"
  end

  private def options_for_levels
    User::Level.raw.names.map { |name| {name, User::Level.new(name)} }
  end
end
