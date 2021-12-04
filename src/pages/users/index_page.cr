struct Users::IndexPage < MainLayout
  needs users : Array(User)
  needs pages : Lucky::Paginator

  def page_title
    "Users"
  end

  def content
    h1 "Users"

    if users.empty?
      para do
        text "No users"
      end
    else
      ul do
        users.each do |user|
          li do
            text user.full_name
            text " | "
            link "[e] edit", to: Edit.with(user.id)
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
