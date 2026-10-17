class CreatePasswordResets::V20200428231231 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "pg_trgm"
    enable_extension "pgcrypto"

    create :password_resets do
      primary_key id : UUID

      add_belongs_to user : User, foreign_key_type: UUID, on_delete: :cascade

      add active_at : Time
      add inactive_at : Time?
      add ip_address : String
      add success : Bool
      add token_digest : String
    end

    execute <<-SQL
      CREATE INDEX password_resets_search_index ON password_resets
      USING gin (ip_address gin_trgm_ops);
      SQL
  end

  def rollback
    drop :password_resets
  end
end
