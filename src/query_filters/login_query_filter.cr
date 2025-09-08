struct LoginQueryFilter
  include Mixins::QueryFilter

  def initialize(@query = LoginQuery.new)
  end

  def run(params : Lucky::Params) : LoginQuery
    query = @query
    query = filter_search(query, params)
    query = filter_order_by(query, params)
    query = filter_status(query, params)
    query = filter_ids(query, params)
    query = filter_user_id(query, params)
    query
  end

  # ?search=some+query
  private def filter_search(query, params)
    params.get?(:search).try do |search|
      unless search.empty?
        user_query = UserQuery.new.search(search)

        query = query.where(&.ip_address.search(search)
          .or(&.join_user user_query))
      end
    end

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
