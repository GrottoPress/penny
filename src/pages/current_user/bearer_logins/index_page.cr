struct CurrentUser::BearerLogins::IndexPage < MainLayout
  needs bearer_logins : Array(BearerLogin)
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.current_user.bearer_login.index.page_title")
  end

  def content
    h1 Rex.t(:"page.current_user.bearer_login.index.main_title")

    if bearer_logins.empty?
      para do
        text Rex.t(:"page.current_user.bearer_login.index.none_found")
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

            link "[x] #{revoke_text}",
              to: ::BearerLogins::Destroy.with(bearer_login_id: bearer_login.id)
          end
        end

        para do
          link "[x] #{revoke_all_text}", to: Destroy
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end

      para do
        link "[+] #{add_new_text}", to: New
      end
    end
  end
end
