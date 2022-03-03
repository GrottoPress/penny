struct Users::PasswordResets::IndexPage < MainLayout
  needs password_resets : Array(PasswordReset)
  needs user : User
  needs pages : Lucky::Paginator

  def page_title
    "Password Resets for #{user.full_name}"
  end

  def content
    h1 "Password resets for #{user.full_name}"

    if password_resets.empty?
      para do
        text "No password resets"
      end
    else
      ul do
        password_resets.each do |password_reset|
          li do
            text password_reset.active_at.to_s(App.settings.date_format)
            text " | "
            text password_reset.active_at.to_s(App.settings.time_format)
            text " | "
            text password_reset.ip_address
            text " | "

            link "[x] deactivate",
              to: ::PasswordResets::Destroy.with(password_reset_id: password_reset.id)
          end
        end

        para do
          link "[x] deactivate all", to: Destroy.with(user_id: user.id)
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
