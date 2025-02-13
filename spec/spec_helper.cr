ENV["LUCKY_ENV"] = "test"

require "spec"
require "lucky_flow"
require "lucky_flow/ext/lucky"
require "lucky_flow/ext/avram"

require "../src/app"
require "./support/flows/base_flow"
require "./support/**"
require "../db/migrations/**"

# Add/modify files in spec/setup to start/configure programs or run hooks
#
# By default there are scripts for setting up and cleaning the database,
# configuring LuckyFlow, starting the app server, etc.
require "./setup/**"

require "shield/spec"
require "mel/spec"

Habitat.raise_if_missing_settings!

Avram::Migrator::Runner.new.ensure_migrated!
Avram::SchemaEnforcer.ensure_correct_column_mappings!

include Carbon::Expectations
include Lucky::RequestExpectations
include LuckyFlow::Expectations
include Avram::Expectations
