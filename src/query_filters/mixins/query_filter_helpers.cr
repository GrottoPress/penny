module Mixins::QueryFilterHelpers
  macro included
    # ?ids[]=123&ids[]=456
    private def filter_ids(query, params)
      params.get_all?(:ids).try do |ids|
        query = query.id.in(ids) unless ids.empty?
      end

      query
    end

    # ?order_by:created_at=desc&order_by:first_name=asc
    private def filter_order_by(query, params)
      params.nested?(:order_by).each do |column, order|
        clean_column = PG::EscapeHelper.escape_identifier(column)
        query = query.order_by(clean_column, order, :nulls_first)
      end

      query
    end

    # ?user_id=123
    private def filter_user_id(query, params)
      params.get?(:user_id).try do |user_id|
        query = query.user_id(user_id)
      end

      query
    end
  end
end
