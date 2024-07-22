struct BearerLogins::IndexPage
  include Mixins::MainLayout

  needs bearer_logins : Array(BearerLogin)
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.bearer_login.index.page_title")
  end

  def content
    h1 Rex.t(:"page.bearer_login.index.main_title")

    if bearer_logins.empty?
      para do
        text Rex.t(:"page.bearer_login.index.none_found")
      end
    else
      ul do
        bearer_logins.each do |bearer_login|
          li do
            text Rex.l(bearer_login.active_at.date)
            text " | "
            text Rex.l(bearer_login.active_at)
            text " | "
            text bearer_login.user.full_name
            text " | "
            text bearer_login.name
            text " | "
            link "[-] #{delete_text}", to: Destroy.with(bearer_login.id)
            br
            text bearer_login.scopes.join(", ")
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
