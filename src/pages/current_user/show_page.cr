class CurrentUser::ShowPage < MainLayout
  needs user : User

  def page_title
    "User account"
  end

  def content
    h1 "User Account"

    div do
      text "Hi, #{user.first_name}!"
      text " | "
      link "[e] edit", to: Edit
      text " | "
      link "[x] log out", to: CurrentLogin::Destroy
    end
  end
end
