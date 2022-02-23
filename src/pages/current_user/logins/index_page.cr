struct CurrentUser::Logins::IndexPage < MainLayout
  needs logins : Array(Login)
  needs pages : Lucky::Paginator

  def page_title
    "Your active logins"
  end

  def content
    h1 "Your Active Logins"

    if logins.empty?
      para do
        text "No active logins"
      end
    else
      ul do
        logins.each do |login|
          li do
            text login.active_at.to_s(App.settings.date_format)
            text " | "
            text login.active_at.to_s(App.settings.time_format)
            text " | "
            text login.ip_address
            text " | "
            link "[x] log out", to: ::Logins::Destroy.with(login_id: login.id)
          end
        end

        para do
          link "[x] log out everywhere", to: Destroy
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
