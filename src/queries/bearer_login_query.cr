class BearerLoginQuery < BearerLogin::BaseQuery
  def search(keywords)
    where(&.name.search(keywords)
      .or(&.left_join_user(UserQuery.new.search keywords)))
  end
end
