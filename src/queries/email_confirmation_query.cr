class EmailConfirmationQuery < EmailConfirmation::BaseQuery
  include Mixins::QueryHelpers

  def search(keywords)
    where(&.search(self.class.ip_address_column, keywords)
      .or(&.left_join_user(UserQuery.new.search keywords)))
  end

  def self.ip_address_column
    "#{T.table_name}.ip_address"
  end
end
