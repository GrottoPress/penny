struct Logins::IndexPage
  include Mixins::MainLayout

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
            text Rex.l(login.active_at.date)
            text " | "
            text Rex.l(login.active_at)
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
