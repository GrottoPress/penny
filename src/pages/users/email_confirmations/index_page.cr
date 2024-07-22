struct Users::EmailConfirmations::IndexPage
  include Mixins::MainLayout

  needs email_confirmations : Array(EmailConfirmation)
  needs user : User
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.user.email_confirmation.index.page_title",
      full_name: user.full_name)
  end

  def content
    h1 Rex.t(:"page.user.email_confirmation.index.main_title",
      full_name: user.full_name)

    if email_confirmations.empty?
      para do
        text Rex.t(:"page.user.email_confirmation.index.none_found")
      end
    else
      ul do
        email_confirmations.each do |email_confirmation|
          li do
            text Rex.l(email_confirmation.active_at.date)
            text " | "
            text Rex.l(email_confirmation.active_at)
            text " | "
            text email_confirmation.ip_address
            text " | "

            link "[x] #{deactivate_text}",
              to: ::EmailConfirmations::Destroy.with(
                email_confirmation_id: email_confirmation.id
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
