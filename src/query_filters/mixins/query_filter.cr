# Query filters are responsible for filtering queries based on
# request parameters. This is especially useful in API index actions,
# where clients may want to filter results based on a search query,
# for instance.
module Mixins::QueryFilter
  macro included
    include Lucille::QueryFilter
    include Mixins::QueryFilterHelpers
  end
end
