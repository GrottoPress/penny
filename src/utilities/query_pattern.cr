# This checks if any field in a collection of fields matches a pattern. It is
# used in query loaders and response filters to match request parameters with a
# pattern to determine which items should appear in API responses.
#
# A pattern is always two parts; a resource and an attribute separated by a dot
# (.). Eg: `user.name`, `bearer_login.name`, `login.*`.
#
# IDs and foreign keys are always skipped because they are always already
# included in responses. Patterns that end with ".*" are wildcards.
struct QueryPattern
  def initialize(@pattern : String)
  end

  def match?(*fields : String)
    match?(fields)
  end

  def match?(fields : Indexable(String)?) : Bool?
    fields.try do |items|
      next false if @pattern.ends_with?(".id") || @pattern.ends_with?("_id")

      items.any? do |item|
        next false if item.ends_with?(".id") || item.ends_with?("_id")
        next item.starts_with?(@pattern[..-2]) if @pattern.ends_with?(".*")
        next @pattern.starts_with?(item[..-2]) if item.ends_with?(".*")

        item == @pattern
      end
    end
  end

  def self.match?(pattern, fields)
    new(pattern).match?(fields)
  end
end
