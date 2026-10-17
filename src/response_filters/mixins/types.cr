private alias ApiResponseValue = Union(
  ApiResponse,
  Array(String),
  Bool,
  Int64,
  String,
  UserLevel,
  UserSettings
)

alias ApiResponse = Hash(Symbol, ApiResponseValue)
