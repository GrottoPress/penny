class CreateUserOptions::V20200905163024 < Avram::Migrator::Migration::V1
  def migrate
    create :user_options do
      primary_key id : Int64

      add_timestamps
      add_belongs_to user : User, on_delete: :cascade, unique: true

      add login_notify : Bool
      add password_notify : Bool
    end
  end

  def rollback
    drop :user_options
  end
end
