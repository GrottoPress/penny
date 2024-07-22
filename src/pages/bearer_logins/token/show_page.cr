struct BearerLogins::Token::ShowPage
  include Mixins::MainLayout

  needs bearer_login : BearerLogin
  needs token : String

  def page_title
    Rex.t(:"page.bearer_login.show.page_title", name: bearer_login.name)
  end

  def content
    h1 Rex.t(:"page.bearer_login.show.main_title", name: bearer_login.name)

    para Rex.t(:"page.bearer_login.show.copy_token")
    pre token

    para do
      link "[=] #{list_text}", to: Index
      text " | "
      link "[+] #{add_new_text}", to: CurrentUser::BearerLogins::New
    end
  end
end
