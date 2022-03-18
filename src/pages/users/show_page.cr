struct Users::ShowPage < MainLayout
  needs user : User

  def page_title
    Rex.t(:"page.user.show.page_title", full_name: user.full_name)
  end

  def content
    h1 Rex.t(:"page.user.show.main_title", full_name: user.full_name)

    div do
      text user.full_name
      text " | "
      link "[e] #{edit_text}", to: Edit.with(user_id: user.id)
    end
  end
end
