class Menus::AdminPrimary < BaseComponent
  def render
    para do
      link "Home", to: Home::Index
      text " | "
      link "Account", to: CurrentUser::Show
      text " | "
      link "Users", to: Users::Index
      text " | "
      link "Logins", to: Logins::Index
      text " | "
      link "Bearer logins", to: BearerLogins::Index
      text " | "
      link "Email confirmations", to: EmailConfirmations::Index
    end
  end
end
