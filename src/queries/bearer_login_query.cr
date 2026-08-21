class BearerLoginQuery < BearerLogin::BaseQuery
  include Mixins::QueryHelpers

  def search(keywords)
    where(&.search(self.class.name_column, keywords)
      .or(&.left_join_user(UserQuery.new.search keywords)))
  end

  def self.name_column
    "#{T.table_name}.name"
  end
end
