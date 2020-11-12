class CreateUserOptions::V20200905163024 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(UserOptions) do
      primary_key id : Int64

      add_timestamps
      add_belongs_to user : User, on_delete: :cascade

      add login_notify : Bool
      add password_notify : Bool
    end

    # This sets a "UNIQUE" constraint on the foreign key (user_id)
    execute <<-SQL
    ALTER TABLE #{table_for(UserOptions)} ADD CONSTRAINT
    #{table_for(UserOptions)}_user_id_unique UNIQUE (user_id);
    SQL
  end

  def rollback
    drop table_for(UserOptions)
  end
end
