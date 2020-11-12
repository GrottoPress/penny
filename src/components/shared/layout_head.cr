class Shared::LayoutHead < BaseComponent
  needs page_title : String
  # This is used by the 'csrf_meta_tags' method
  needs context : HTTP::Server::Context

  def render
    head do
      utf8_charset
      title "#{page_title_with_separator}#{App.settings.name}"
      css_link asset("css/app.css"), data_turbolinks_track: "reload"
      js_link asset("js/app.js"), defer: "true", data_turbolinks_track: "reload"
      meta name: "turbolinks-cache-control", content: "no-cache"
      csrf_meta_tags
      responsive_meta_tag
      empty_tag "link", rel: "icon", href: App.settings.favicon_url
    end
  end

  private def page_title_with_separator
    page_title.empty? ? "" : "#{page_title} | "
  end
end
