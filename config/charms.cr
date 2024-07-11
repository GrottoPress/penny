# These are needed to make Avram models JSON-serializable,
# for use in Mel.
#
struct PG::Numeric
  include JSON::Serializable
end

abstract class Avram::Model
  include JSON::Serializable
end
