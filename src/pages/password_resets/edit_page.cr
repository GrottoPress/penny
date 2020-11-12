class PasswordResets::EditPage < AuthLayout
  needs operation : ResetPassword

  def page_title
    "Edit password"
  end

  def content
    h1 "Edit Password"

    form_for Update do
      para do
        mount Shared::Field, operation.password do |builder|
          builder.password_input
        end
      end

      para do
        button "Update password", role: "submit"
      end
    end
  end
end
