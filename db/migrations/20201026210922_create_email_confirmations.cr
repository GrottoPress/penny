class CreateEmailConfirmations::V20201026210922 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "pg_trgm"
    enable_extension "pgcrypto"

    create :email_confirmations do
      primary_key id : UUID

      add_belongs_to user : User?, foreign_key_type: UUID, on_delete: :cascade

      add email : String

      add active_at : Time
      add inactive_at : Time?
      add ip_address : String
      add success : Bool
      add token_digest : String
    end

    execute <<-SQL
      CREATE INDEX email_confirmations_search_index ON email_confirmations
      USING gin (ip_address gin_trgm_ops);
      SQL
  end

  def rollback
    drop :email_confirmations
  end
end
