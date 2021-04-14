class CreatePasswordResets::V20200428231231 < Avram::Migrator::Migration::V1
  def migrate
    create :password_resets do
      primary_key id : Int64

      add_belongs_to user : User, on_delete: :cascade

      add token_digest : String
      add ip_address : String
      add started_at : Time
      add ended_at : Time?
    end
  end

  def rollback
    drop :password_resets
  end
end
