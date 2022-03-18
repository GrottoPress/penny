struct CurrentUser::ShowPage < MainLayout
  needs user : User

  def page_title
    Rex.t(:"page.current_user.show.page_title")
  end

  def content
    h1 Rex.t(:"page.current_user.show.main_title")

    div do
      text Rex.t(:"page.current_user.show.hello",
        first_name: user.first_name,
        last_name: user.last_name,
        full_name: user.full_name)

      text " | "
      link "[e] #{edit_text}", to: Edit
      text " | "
      link "[x] #{log_out_text}", to: CurrentLogin::Destroy
    end
  end
end
