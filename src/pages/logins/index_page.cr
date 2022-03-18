struct Logins::IndexPage < MainLayout
  needs logins : Array(Login)
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.login.index.page_title")
  end

  def content
    h1 Rex.t(:"page.login.index.main_title")

    if logins.empty?
      para do
        text Rex.t(:"page.login.index.none_found")
      end
    else
      ul do
        logins.each do |login|
          li do
            text login.active_at.to_s(App.settings.date_format)
            text " | "
            text login.active_at.to_s(App.settings.time_format)
            text " | "
            text login.user.full_name
            text " | "
            text login.ip_address
            text " | "
            link "[-] #{log_out_text}", to: Destroy.with(login.id)
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
