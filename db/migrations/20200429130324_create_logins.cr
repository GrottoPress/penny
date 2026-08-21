class CreateLogins::V20200429130324 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "pg_trgm"

    create :logins do
      primary_key id : Int64

      add_belongs_to user : User, on_delete: :cascade

      add active_at : Time
      add inactive_at : Time?
      add ip_address : String
      add token_digest : String
    end

    execute <<-SQL
      CREATE INDEX logins_search_index ON logins
      USING gin (ip_address gin_trgm_ops);
      SQL
  end

  def rollback
    drop :logins
  end
end
