struct PasswordResets::NewPage < AuthLayout
  needs operation : StartPasswordReset

  def page_title
    "Password reset"
  end

  def content
    h1 "Password Reset"

    form_for Create do
      para do
        mount Shared::Field, operation.email
      end

      para do
        link "Remembered your password?", to: CurrentLogin::New
        text " | "
        link "Don't have an account?", to: EmailConfirmations::New
      end

      para do
        button "Send email", role: "submit"
      end
    end
  end
end
