struct PasswordResets::IndexPage < MainLayout
  needs password_resets : Array(PasswordReset)
  needs pages : Lucky::Paginator

  def page_title
    "Active password resets"
  end

  def content
    h1 "Active Password Resets"

    if password_resets.empty?
      para do
        text "No active password resets"
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
            link "[-] deactivate", to: Destroy.with(password_reset.id)
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
