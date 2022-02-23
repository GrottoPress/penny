struct CurrentUser::BearerLogins::IndexPage < MainLayout
  needs bearer_logins : Array(BearerLogin)
  needs pages : Lucky::Paginator

  def page_title
    "Your active bearer logins"
  end

  def content
    h1 "Your Active Bearer Logins"

    if bearer_logins.empty?
      para do
        text "No active bearer logins"
      end
    else
      ul do
        bearer_logins.each do |bearer_login|
          li do
            text bearer_login.active_at.to_s(App.settings.date_format)
            text " | "
            text bearer_login.active_at.to_s(App.settings.time_format)
            text " | "
            text bearer_login.name
            text " | "

            link "[x] revoke",
              to: ::BearerLogins::Destroy.with(bearer_login_id: bearer_login.id)
          end
        end

        para do
          link "[x] revoke all", to: Destroy
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end

      para do
        link "[+] add new", to: New
      end
    end
  end
end
