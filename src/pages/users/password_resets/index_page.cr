struct Users::PasswordResets::IndexPage
  include Mixins::MainLayout

  needs password_resets : Array(PasswordReset)
  needs user : User
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.user.password_reset.index.page_title",
      full_name: user.full_name)
  end

  def content
    h1 Rex.t(:"page.user.password_reset.index.main_title",
      full_name: user.full_name)

    if password_resets.empty?
      para do
        text Rex.t(:"page.user.password_reset.index.none_found")
      end
    else
      ul do
        password_resets.each do |password_reset|
          li do
            text Rex.l(password_reset.active_at.date)
            text " | "
            text Rex.l(password_reset.active_at)
            text " | "
            text password_reset.ip_address
            text " | "

            link "[x] #{deactivate_text}", to: ::PasswordResets::Destroy.with(
              password_reset_id: password_reset.id
            )
          end
        end

        para do
          link "[x] #{deactivate_all_text}", to: Destroy.with(user_id: user.id)
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
