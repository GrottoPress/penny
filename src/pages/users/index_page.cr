struct Users::IndexPage < MainLayout
  needs users : Array(User)
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.user.index.page_title")
  end

  def content
    h1 Rex.t(:"page.user.index.main_title")

    if users.empty?
      para do
        text Rex.t(:"page.user.index.none_found")
      end
    else
      ul do
        users.each do |user|
          li do
            text user.full_name
            text " | "
            link "[e] #{edit_text}", to: Edit.with(user.id)
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
