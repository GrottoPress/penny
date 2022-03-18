struct PasswordResets::NewPage < AuthLayout
  needs operation : StartPasswordReset

  def page_title
    Rex.t(:"page.password_reset.new.page_title")
  end

  def content
    h1 Rex.t(:"page.password_reset.new.main_title")

    form_for Create do
      para do
        mount Shared::Field, operation.email
      end

      para do
        link remembered_password_text, to: CurrentLogin::New
        text " | "
        link no_account_text, to: ::EmailConfirmations::New
      end

      para do
        button Rex.t(:"page.password_reset.new.form.submit.label"),
          role: "submit"
      end
    end
  end
end
