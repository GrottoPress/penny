class CreateUsers::V20200428163501 < Avram::Migrator::Migration::V1
  def migrate
    create :users do
      primary_key id : Int64

      add_timestamps

      add email : String, unique: true
      add first_name : String
      add last_name : String
      add level : String
      add password_digest : String
    end
  end

  def rollback
    drop :users
  end
end
