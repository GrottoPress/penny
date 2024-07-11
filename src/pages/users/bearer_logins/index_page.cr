struct Users::BearerLogins::IndexPage < MainLayout
  needs bearer_logins : Array(BearerLogin)
  needs user : User
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.user.bearer_login.index.page_title", full_name: user.full_name)
  end

  def content
    h1 Rex.t(:"page.user.bearer_login.index.main_title",
      full_name: user.full_name)

    if bearer_logins.empty?
      para do
        text Rex.t(:"page.user.bearer_login.index.none_found")
      end
    else
      ul do
        bearer_logins.each do |bearer_login|
          li do
            text Rex.l(bearer_login.active_at.date)
            text " | "
            text Rex.l(bearer_login.active_at)
            text " | "
            text bearer_login.name
            text " | "

            link "[x] #{revoke_text}",
              to: ::BearerLogins::Destroy.with(bearer_login_id: bearer_login.id)
          end
        end

        para do
          link "[x] #{revoke_all_text}", to: Destroy.with(user_id: user.id)
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
