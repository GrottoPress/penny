class UserQuery < User::BaseQuery
  def search(keywords)
    where(
      "(#{table_name}.email || ' ' || #{table_name}.full_name) ILIKE ?",
      "%#{keywords}%"
    ).order_by(
      "LENGTH(#{table_name}.email || #{table_name}.full_name)",
      :ASC
    )
  end
end
