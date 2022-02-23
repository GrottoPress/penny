struct Users::Logins::IndexPage < MainLayout
  needs logins : Array(Login)
  needs user : User
  needs pages : Lucky::Paginator

  def page_title
    "Logins for #{user.full_name}"
  end

  def content
    h1 "Logins for #{user.full_name}"

    if logins.empty?
      para do
        text "No logins"
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

            link "[x] log user out",
              to: ::Logins::Destroy.with(login_id: login.id)
          end
        end

        para do
          link "[x] log user out everywhere", to: Destroy.with(user_id: user.id)
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
