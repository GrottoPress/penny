struct UserQueryFilter
  include Mixins::QueryFilter

  def initialize(@query = UserQuery.new)
  end

  def run(params : Lucky::Params) : UserQuery
    query = @query
    query = filter_search(query, params)
    query = filter_level(query, params)
    query = filter_order_by(query, params)
    query = filter_ids(query, params)
    query
  end

  # ?level=admin
  private def filter_level(query, params)
    params.get?(:level).try do |level|
      query = query.level(level) unless level.empty?
    end

    query
  end

  # ?search=some+query
  private def filter_search(query, params)
    params.get?(:search).try do |search|
      unless search.empty?
        query = query.search(search)
      end
    end

    query
  end
end
