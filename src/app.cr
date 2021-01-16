# Hack to prevent a segfault for static linking
# @link https://hub.docker.com/r/jrei/crystal-alpine
# {% if flag?(:static) %}
#   require "llvm/lib_llvm"
#   require "llvm/enums"
# {% end %}

require "envy"
require "lucky"
require "carbon"
# require "annotation"
require "shield"

require "./app_settings"
require "../config/charms"
require "./app_database"
require "./models/mixins/**"
require "./models/base_model"
require "./models/**"

require "shield/presets"

require "./queries/mixins/**"
require "./queries/**"
require "./operations/mixins/**"
require "./operations/**"
require "./serializers/base_serializer"
require "./serializers/**"
require "./emails/base_email"
require "./emails/**"
require "./actions/mixins/**"
require "./actions/**"
require "./components/base_component"
require "./components/**"
require "./pages/mixins/**"
require "./pages/**"
require "./handlers/base_handler"
require "./handlers/**"
require "../config/env"
require "../config/**"
require "../db/migrations/**"
require "./app_server"
