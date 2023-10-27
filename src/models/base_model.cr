abstract class BaseModel < Avram::Model
  include Shield::Model

  macro default_columns
    primary_key id : Int64
  end

  def self.database : Avram::Database.class
    AppDatabase
  end
end
