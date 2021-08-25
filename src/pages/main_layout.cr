abstract class MainLayout
  include Lucky::HTMLPage

  # The default page title. It is passed to `Shared::LayoutHead`.
  #
  # Add a `page_title` method to pages to override it. You can also remove
  # This method so every page is required to have its own page title.
  def page_title
    "Penny"
  end

  def render
    html_doctype

    html lang: "en" do
      mount Shared::LayoutHead, page_title: page_title

      body do
        mount Menus::Primary
        mount Shared::FlashMessages, flash: context.flash
        content
      end
    end
  end
end
