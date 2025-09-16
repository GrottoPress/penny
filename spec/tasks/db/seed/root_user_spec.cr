require "../../../spec_helper"

describe Db::Seed::RootUser do
  it "adds first admin user" do
    Db::Seed::RootUser.new.call
    UserQuery.new.level(:admin).any?.should be_true
  end

  it "skips if at least one admin user exists" do
    UserFactory.create &.level(:admin)
    Db::Seed::RootUser.new.call

    UserQuery.new.select_count.should eq(1)
  end
end
