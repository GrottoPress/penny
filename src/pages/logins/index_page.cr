class Logins::IndexPage < MainLayout
  needs logins : Array(Login)
  needs pages : Lucky::Paginator

  def page_title
    "Active logins"
  end

  def content
    h1 "Active Logins"

    if logins.empty?
      para do
        text "No active logins"
      end
    else
      ul do
        logins.each do |login|
          li do
            text login.active_at.to_s
            text " | "
            text login.ip_address
            text " | "
            link "[-] log out", to: Destroy.with(login.id)
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
