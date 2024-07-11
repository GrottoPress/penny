struct CurrentLogin::NewPage < AuthLayout
  needs operation : StartCurrentLogin

  def page_title
    Rex.t(:"page.current_login.new.page_title")
  end

  def content
    h1 Rex.t(:"page.current_login.new.main_title")

    form_for Create do
      para do
        mount Shared::Field, operation.email
      end

      para do
        mount Shared::Field, operation.password do |builder|
          builder.password_input
        end
      end

      para do
        link lost_password_text, to: ::PasswordResets::New
        text " | "
        link no_account_text, to: ::EmailConfirmations::New
      end

      para do
        button Rex.t(:"page.current_login.new.form.submit.label"),
          role: "submit",
          flow_id: "login-button"
      end
    end
  end
end
