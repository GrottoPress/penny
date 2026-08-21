class UserQuery < User::BaseQuery
  include Mixins::QueryHelpers

  def search(keywords)
    search(<<-SQL, keywords)
      (#{self.class.email_column} || ' ' ||
        #{self.class.first_name_column} || ' ' ||
        #{self.class.last_name_column})
      SQL
  end

  def self.email_column
    "#{T.table_name}.email"
  end

  def self.first_name_column
    "#{T.table_name}.first_name"
  end

  def self.last_name_column
    "#{T.table_name}.last_name"
  end
end
