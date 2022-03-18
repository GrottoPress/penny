class Menus::Primary < BaseComponent
  def render
    para do
      link Rex.t(:"page.menu.home"), to: Home::Index
      text " | "
      link Rex.t(:"page.menu.account"), to: CurrentUser::Show
      text " | "
      link Rex.t(:"page.menu.logins"), to: CurrentUser::Logins::Index
      text " | "

      link Rex.t(:"page.menu.bearer_logins"),
        to: CurrentUser::BearerLogins::Index

      text " | "

      link Rex.t(:"page.menu.email_confirmations"),
        to: CurrentUser::EmailConfirmations::Index

      text " | "

      link Rex.t(:"page.menu.password_resets"),
        to: CurrentUser::PasswordResets::Index
    end
  end
end
