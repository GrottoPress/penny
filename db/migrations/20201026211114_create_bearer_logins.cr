class CreateBearerLogins::V20201026211114 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(BearerLogin) do
      primary_key id : Int64

      add_belongs_to user : User, on_delete: :cascade

      add name : String
      add scopes : Array(String)

      add token_digest : String
      add started_at : Time
      add ended_at : Time?
    end
  end

  def rollback
    drop table_for(BearerLogin)
  end
end
