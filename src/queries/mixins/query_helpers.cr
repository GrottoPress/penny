module Mixins::QueryHelpers
  macro included
    protected def search(column : String | Symbol, keywords : String)
      keywords = keywords[0, 255]
      clean_keywords = PG::EscapeHelper.escape_literal(keywords)

      where("#{column} ILIKE ?", "%#{keywords.split.join('%')}%")
        .order_by("SIMILARITY(#{column}, #{clean_keywords})", :DESC)
    end
  end
end
