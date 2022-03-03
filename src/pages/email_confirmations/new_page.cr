struct EmailConfirmations::NewPage < AuthLayout
  needs operation : StartEmailConfirmation

  def page_title
    "Email confirmation"
  end

  def content
    h1 "Email Confirmation"

    form_for Create do
      para do
        mount Shared::Field, operation.email
      end

      para do
        link "Have an account?", to: CurrentLogin::New
        text " | "
        link "Lost your password?", to: ::PasswordResets::New
      end

      para do
        button "Send email", role: "submit"
      end
    end
  end
end
