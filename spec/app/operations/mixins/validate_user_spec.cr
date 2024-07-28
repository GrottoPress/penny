require "../../../spec_helper"

private class SaveUser < User::SaveOperation
  permit_columns :first_name, :last_name, :level

  before_save do
    email.value = "user@example.com"
    password_digest.value = "a1b2c3"

    settings.value = UserSettings.from_json({
      bearer_login_notify: true,
      login_notify: true,
      password_notify: true,
    }.to_json)
  end

  include Mixins::ValidateUser
end

describe Mixins::ValidateUser do
  it "requires first name" do
    SaveUser.create(params(
      last_name: "Nkrumah",
      level: :author
    )) do |operation, _|
      operation.saved?.should be_false
      operation.first_name.should have_error("is required")
    end
  end

  it "requires last name" do
    SaveUser.create(params(
      first_name: "Kwame",
      level: :author
    )) do |operation, _|
      operation.saved?.should be_false
      operation.last_name.should have_error("is required")
    end
  end

  it "requires level" do
    SaveUser.create(params(
      first_name: "Kwame",
      last_name: "Atta"
    )) do |operation, _|
      operation.saved?.should be_false
      operation.level.should have_error("is required")
    end
  end

  it "requires valid first name format" do
    SaveUser.create(params(first_name: "K/L", level: :author)) do |operation, _|
      operation.saved?.should be_false
      operation.first_name.should have_error("not a valid")
    end
  end

  it "requires valid last name format" do
    SaveUser.create(params(last_name: "K/L", level: :author)) do |operation, _|
      operation.saved?.should be_false
      operation.last_name.should have_error("not a valid")
    end
  end

  it "rejects long first name" do
    SaveUser.create(params(
      first_name: "f" * 300,
      last_name: "Atta",
      level: :author
    )) do |operation, _|
      operation.saved?.should be_false
      operation.first_name.should have_error("longer than")
    end
  end

  it "rejects long last name" do
    SaveUser.create(params(
      first_name: "Kiddi",
      last_name: "l" * 300,
      level: :author
    )) do |operation, _|
      operation.saved?.should be_false
      operation.last_name.should have_error("longer than")
    end
  end
end
