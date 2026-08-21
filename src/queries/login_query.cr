class LoginQuery < Login::BaseQuery
  def search(keywords)
    where(&.ip_address.search(keywords)
      .or(&.left_join_user(UserQuery.new.search keywords)))
  end
end
