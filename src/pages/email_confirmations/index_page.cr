struct EmailConfirmations::IndexPage < MainLayout
  needs email_confirmations : Array(EmailConfirmation)
  needs pages : Lucky::Paginator

  def page_title
    Rex.t(:"page.email_confirmation.index.page_title")
  end

  def content
    h1 Rex.t(:"page.email_confirmation.index.main_title")

    if email_confirmations.empty?
      para do
        text Rex.t(:"page.email_confirmation.index.none_found")
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

            link "[-] #{deactivate_text}",
              to: Destroy.with(email_confirmation.id)
          end
        end
      end

      if pages.total > 1
        mount Lucky::Paginator::SimpleNav, pages
      end
    end
  end
end
