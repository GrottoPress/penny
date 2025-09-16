require "../../../spec_helper"

describe Db::Seed::RequiredData do
  it "loads required data" do
    Db::Seed::RequiredData.new.call
    UserQuery.new.level(:admin).any?.should be_true
  end
end
