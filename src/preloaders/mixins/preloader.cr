# Preloaders preload associations based on request parameters. This is used
# with response filters to preload only associations that are actually requested
# by the client
module Mixins::Preloader
  macro included
    include Lucille::Preloader
    include Mixins::PreloaderHelpers
  end
end
