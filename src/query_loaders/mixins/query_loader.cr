# Query loaders preload associations based on request parameters. This is used
# with response filters to preload only associations that are actually requested
# by the client
module Mixins::QueryLoader
  macro included
    include Mixins::QueryLoaderHelpers

    def run(query, params : Lucky::Params)
      run(query, params.get_all?(:fields))
    end

    def self.run(query, params)
      new.run(query, params)
    end
  end
end
