require "../../spec_helper"

describe QueryPattern do
  it "matches wildcard patterns" do
    pattern = QueryPattern.new("login.*")

    pattern.match?("login.*").should be_true
    pattern.match?("login.email", "user.email").should be_true
    pattern.match?("login_user.email", "user.email").should be_false
    pattern.match?("user.email").should be_false
  end

  it "matches wildcard fields" do
    pattern = QueryPattern.new("login.email")

    pattern.match?("login.*").should be_true
    pattern.match?("login.email", "user.email").should be_true
    pattern.match?("login_user.email", "user.email").should be_false
    pattern.match?("user.email").should be_false
  end

  it "matches field" do
    pattern = QueryPattern.new("user.email")

    pattern.match?("user.email").should be_true
    pattern.match?("login.email", "user.email").should be_true
    pattern.match?("login.email").should be_false
  end

  it "skips ID patterns" do
    pattern = QueryPattern.new("login.user_id")
    pattern.match?("login.user_id").should be_false

    pattern = QueryPattern.new("login.id")
    pattern.match?("login.id").should be_false
  end

  it "skips ID fields" do
    pattern = QueryPattern.new("login.*")
    pattern.match?("login.id").should be_false
    pattern.match?("login.user_id").should be_false
  end
end
