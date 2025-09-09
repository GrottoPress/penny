struct UserSerializer
  include Mixins::SuccessSerializer

  def initialize(
    @fields : Indexable(String)? = nil,
    @user : User? = nil,
    @users : Array(User)? = nil,
    @message : String? = nil,
    @pages : Lucky::Paginator? = nil,
    @token : String? = nil,
    @current_user : User? = nil
  )
  end

  def self.item(
    user : User,
    fields : Indexable(String)?,
    current_user : User? = nil
  )
    UserResponseFilter.run(user, fields, current_user)
  end

  private def data_json : NamedTuple
    data = previous_def
    data = add_user(data)
    data = add_users(data)
    data = add_token(data)
    data
  end

  private def add_user(data)
    @user.try do |user|
      data = data.merge({user: self.class.item(user, @fields, @current_user)})
    end

    data
  end

  private def add_users(data)
    @users.try do |users|
      data = data.merge({users: self.class.list(users, @fields, @current_user)})
    end

    data
  end

  private def add_token(data)
    @token.try { |token| data = data.merge({token: token}) }
    data
  end
end
