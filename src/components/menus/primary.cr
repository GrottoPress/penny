class Menus::Primary < BaseComponent
  def render
    para do
      link "Home", to: Home::Index
      text " | "
      link "Account", to: CurrentUser::Show
      text " | "
      link "Logins", to: CurrentUser::Logins::Index
      text " | "
      link "Bearer logins", to: CurrentUser::BearerLogins::Index
    end
  end
end
