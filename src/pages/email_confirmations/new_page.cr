struct EmailConfirmations::NewPage < AuthLayout
  needs operation : StartEmailConfirmation

  def page_title
    Rex.t(:"page.email_confirmation.new.page_title")
  end

  def content
    h1 Rex.t(:"page.email_confirmation.new.main_title")

    form_for Create do
      para do
        mount Shared::Field, operation.email
      end

      para do
        link have_account_text, to: CurrentLogin::New
        text " | "
        link lost_password_text, to: ::PasswordResets::New
      end

      para do
        button Rex.t(:"page.email_confirmation.new.form.submit.label"),
          role: "submit"
      end
    end
  end
end
