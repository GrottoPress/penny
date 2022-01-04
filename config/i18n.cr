I18n.config.loaders << I18n::Loader::YAML.new("config/locales")
I18n.config.default_locale = :en
I18n.init

private struct I18nAdapter
  include Rex::Adapter

  def translate(text : String | Symbol, *args) : String
    I18n.t(text, *args)
  end

  def localize(value, *args) : String
    I18n.l(value, *args)
  end
end

Rex.configure do |settings|
  settings.adapter = I18nAdapter.new
end
