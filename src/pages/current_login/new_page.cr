struct CurrentLogin::NewPage < AuthLayout
  needs operation : StartCurrentLogin

  def page_title
    "Log in"
  end

  def content
    h1 "Log In"

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
        link "Don't have an account?", to: EmailConfirmations::New
        text " | "
        link "Lost your password?", to: PasswordResets::New
      end

      para do
        button "Log in", role: "submit", flow_id: "login-button"
      end
    end
  end
end
