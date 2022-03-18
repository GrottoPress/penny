struct Users::Logins::IndexPage < MainLayout
  needs logins : Array(Login)
  needs user : User
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.user.login.index.page_title", full_name: user.full_name)
  end

  def content
    h1 Rex.t(:"page.user.login.index.main_title", full_name: user.full_name)

    if logins.empty?
      para do
        text Rex.t(:"page.user.login.index.none_found")
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

            link "[x] #{log_out_text}",
              to: ::Logins::Destroy.with(login_id: login.id)
          end
        end

        para do
          link "[x] #{log_out_everywhere_text}",
            to: Destroy.with(user_id: user.id)
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
