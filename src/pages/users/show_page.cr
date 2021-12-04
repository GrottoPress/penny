struct Users::ShowPage < MainLayout
  needs user : User

  def page_title
    user.full_name
  end

  def content
    h1 user.full_name

    div do
      text user.full_name
      text " | "
      link "[e] edit", to: Edit.with(user_id: user.id)
    end
  end
end
