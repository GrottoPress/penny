class Menus::Primary < BaseComponent
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
    end
  end
end
