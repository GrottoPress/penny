# Query filters are responsible for filtering queries based on
# request parameters. This is especially useful in API index actions,
# where clients may want to filter results based on a search query,
# for instance.
module Mixins::QueryFilter
  abstract def run(params : Lucky::Params) : Avram::Queryable

  macro included
    include Mixins::QueryFilterHelpers

    def self.run(query, params)
      new(query).run(params)
    end
  end
end
