class CreateUsers::V20200428163501 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "pg_trgm"

    create :users do
      primary_key id : Int64

      add_timestamps

      add email : String, unique: true
      add first_name : String
      add last_name : String
      add level : String
      add password_digest : String
      add settings : JSON::Any
    end

    execute <<-SQL
      CREATE INDEX users_search_index ON users USING gin ((
        email || ' ' || first_name || ' ' || last_name
      ) gin_trgm_ops);
      SQL
  end

  def rollback
    drop :users
  end
end
