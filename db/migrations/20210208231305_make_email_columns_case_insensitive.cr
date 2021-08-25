class MakeEmailColumnsCaseInsensitive::V20210208231305 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "citext"

    alter :users do
      change_type email : String, case_sensitive: false
    end

    alter :email_confirmations do
      change_type email : String, case_sensitive: false
    end
  end

  def rollback
    disable_extension "citext"

    alter :users do
      change_type email : String, case_sensitive: true
    end

    alter :email_confirmations do
      change_type email : String, case_sensitive: true
    end
  end
end
