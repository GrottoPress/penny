struct LoginQueryFilter
  include Mixins::QueryFilter

  def initialize(@query = LoginQuery.new)
  end

  def run(params : Avram::Paramable) : LoginQuery
    query = @query
    query = filter_search(query, params)
    query = filter_order_by(query, params)
    query = filter_status(query, params)
    query = filter_ids(query, params)
    query = filter_user_id(query, params)
    query
  end

  # ?status=active
  private def filter_status(query, params)
    params.get?(:status).try do |status|
      case status.downcase
      when "active"
        query = query.is_active
      when "inactive"
        query = query.is_inactive
      end
    end

    query
  end
end
