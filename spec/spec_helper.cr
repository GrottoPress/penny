ENV["LUCKY_ENV"] = "test"
ENV["DEV_PORT"] = "5001"

require "spec"
require "lucky_flow"
require "../src/app"
require "./support/flows/base_flow"
require "./support/**"
# require "../db/migrations/**"

# Add/modify files in spec/setup to start/configure programs or run hooks
#
# By default there are scripts for setting up and cleaning the database,
# configuring LuckyFlow, starting the app server, etc.
require "./setup/**"

include Carbon::Expectations
include Lucky::RequestExpectations
include LuckyFlow::Expectations

def assert_valid(attribute)
  attribute.errors.should be_empty
end

def assert_valid(attribute, text)
  attribute.errors.select(&.includes? text).should be_empty
end

def assert_invalid(attribute)
  attribute.errors.should_not be_empty
end

def assert_invalid(attribute, text)
  attribute.errors.select(&.includes? text).size.should eq(1)
end

def params(**named_args)
  Avram::Params.new named_args.to_h
    .transform_keys(&.to_s)
    .transform_values &.to_s
end

Avram::Migrator::Runner.new.ensure_migrated!
Avram::SchemaEnforcer.ensure_correct_column_mappings!
Habitat.raise_if_missing_settings!
