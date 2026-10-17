class CreateBearerLogins::V20201026211114 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "pg_trgm"
    enable_extension "pgcrypto"

    create :bearer_logins do
      primary_key id : UUID

      add_belongs_to user : User, foreign_key_type: UUID, on_delete: :cascade

      add active_at : Time
      add inactive_at : Time?
      add name : String
      add scopes : Array(String)
      add token_digest : String
    end

    execute <<-SQL
      CREATE INDEX bearer_logins_search_index ON bearer_logins
      USING gin (name gin_trgm_ops);
      SQL
  end

  def rollback
    drop :bearer_logins
  end
end
