# These are needed to make Avram models JSON-serializable,
# for use in Mel.
#
struct PG::Numeric
  include JSON::Serializable
end

abstract class Avram::Model
  include JSON::Serializable
end

module Lucky::SelectHelpers
  def options_for_multi_select(
    field : Avram::Attribute(Array(T)),
    select_options : Array(Tuple(String, T)),
    **html_options
  ) : Nil forall T
    select_options.each do |option_name, option_value|
      attributes = {"value" => option_value.to_s}

      is_selected = field.value && attributes["value"].in?(field.value.not_nil!)
      attributes["selected"] = "selected" if is_selected

      option option_name, merge_options(html_options, attributes)
    end
  end
end
