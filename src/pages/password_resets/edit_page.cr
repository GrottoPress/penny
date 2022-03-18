struct PasswordResets::EditPage < AuthLayout
  needs operation : ResetPassword

  def page_title
    Rex.t(:"page.password_reset.edit.page_title")
  end

  def content
    h1 Rex.t(:"page.password_reset.edit.main_title")

    form_for Update do
      para do
        mount Shared::Field, operation.password do |builder|
          builder.password_input
        end
      end

      para do
        button Rex.t(:"page.password_reset.edit.form.submit.label"),
          role: "submit"
      end
    end
  end
end
