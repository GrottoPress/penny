struct BearerLogins::IndexPage < MainLayout
  needs bearer_logins : Array(BearerLogin)
  needs pages : Lucky::Paginator

  def page_title
    "Bearer logins"
  end

  def content
    h1 "Bearer Logins"

    if bearer_logins.empty?
      para do
        text "No bearer logins"
      end
    else
      ul do
        bearer_logins.each do |bearer_login|
          li do
            text bearer_login.name
            text " | "
            link "[-] delete", to: Destroy.with(bearer_login.id)
            br
            text bearer_login.scopes.join(", ")
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end

    para do
      link "[+] add new", to: New
    end
  end
end
