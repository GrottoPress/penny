struct Home::IndexPage < MainLayout
  def page_title
    ""
  end

  def content
    h1 Rex.t(:"page.home.index.main_title")

    para Rex.t(:"page.home.index.main_description")

    h2 Rex.t(:"page.home.index.resources")

    ul do
      li do
        a "Shield", href: "https://github.com/grottopress/shield"
      end

      li do
        a "Penny", href: "https://github.com/grottopress/penny"
      end

      li do
        a "Lucky", href: "https://luckyframework.org"
      end

      li do
        a "Crystal", href: "https://crystal-lang.org"
      end
    end
  end
end
