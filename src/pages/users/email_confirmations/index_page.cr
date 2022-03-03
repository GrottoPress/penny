struct Users::EmailConfirmations::IndexPage < MainLayout
  needs email_confirmations : Array(EmailConfirmation)
  needs user : User
  needs pages : Lucky::Paginator

  def page_title
    "Email confirmations for #{user.full_name}"
  end

  def content
    h1 "Email Confirmations for #{user.full_name}"

    if email_confirmations.empty?
      para do
        text "No email confirmations"
      end
    else
      ul do
        email_confirmations.each do |email_confirmation|
          li do
            text email_confirmation.active_at.to_s(App.settings.date_format)
            text " | "
            text email_confirmation.active_at.to_s(App.settings.time_format)
            text " | "
            text email_confirmation.ip_address
            text " | "

            link "[x] deactivate",
              to: ::EmailConfirmations::Destroy.with(
                email_confirmation_id: email_confirmation.id
              )
          end
        end

        para do
          link "[x] deactivate all", to: Destroy.with(user_id: user.id)
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end