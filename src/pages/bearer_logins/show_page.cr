class BearerLogins::ShowPage < MainLayout
  needs bearer_login : BearerLogin
  needs operation : CreateBearerLogin

  def page_title
    bearer_login.name
  end

  def content
    h1 bearer_login.name

    para "Copy token below:"
    pre BearerLoginHelper.token(bearer_login, operation)

    para do
      link "[=] list all", to: Index
      text " | "
      link "[+] add new", to: New
    end
  end
end
