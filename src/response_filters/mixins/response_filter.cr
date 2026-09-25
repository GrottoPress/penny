# Filter responses based on request parameters, before sending them, via
# serializers, to clients.
#
# This enables a GraphQL-like filtering of responses using a REST interface.
#
# Clients indicate which fields they are interested in by using the `fields`
# parameter. For example: a request with
# `?fields[]=bearer_login.*&fields[]=user.name` parameters would receive a
# response which includes all bearer login fields and the bearer login user's
# names
module Mixins::ResponseFilter
  macro included
    include Lucille::ResponseFilter
    include Mixins::ResponseFilterHelpers
  end
end
