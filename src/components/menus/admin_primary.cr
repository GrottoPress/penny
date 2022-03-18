class Menus::AdminPrimary < BaseComponent
  def render
    para do
      link Rex.t(:"page.menu.home"), to: Home::Index
      text " | "
      link Rex.t(:"page.menu.account"), to: CurrentUser::Show
      text " | "
      link Rex.t(:"page.menu.users"), to: Users::Index
      text " | "
      link Rex.t(:"page.menu.logins"), to: Logins::Index
      text " | "
      link Rex.t(:"page.menu.bearer_logins"), to: BearerLogins::Index
      text " | "

      link Rex.t(:"page.menu.email_confirmations"),
        to: EmailConfirmations::Index

      text " | "
      link Rex.t(:"page.menu.password_resets"), to: PasswordResets::Index
    end
  end
end
