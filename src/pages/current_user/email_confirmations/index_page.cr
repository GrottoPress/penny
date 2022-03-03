struct CurrentUser::EmailConfirmations::IndexPage < MainLayout
  needs email_confirmations : Array(EmailConfirmation)
  needs pages : Lucky::Paginator

  def page_title
    "Your active email confirmations"
  end

  def content
    h1 "Your Active Email Confirmations"

    if email_confirmations.empty?
      para do
        text "No active email confirmations"
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

            link "[x] deactivate", to: ::EmailConfirmations::Destroy.with(
              email_confirmation_id: email_confirmation.id
            )
          end
        end

        para do
          link "[x] deactivate all", to: Destroy
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
