require "../../../spec_helper"

private class SaveUser < User::SaveOperation
  permit_columns :first_name, :last_name

  before_save do
    email.value = "user@example.com"
    password_digest.value = "a1b2c3"
    level.value = UserLevel.new(:author)
  end

  include SaveUserName
end

describe SaveUserName do
  it "saves first and last names" do
    first_name = "Kofi"
    last_name = "Amoako"

    SaveUser.create(params(
      first_name: first_name,
      last_name: last_name
    )) do |_, user|
      user.should be_a(User)

      user.try do |user|
        user.first_name.should eq(first_name)
        user.last_name.should eq(last_name)
      end
    end
  end

  it "requires first name" do
    SaveUser.create(params(last_name: "Nkrumah")) do |operation, _|
      operation.saved?.should be_false
      operation.first_name.should have_error("is required")
    end
  end

  it "requires last name" do
    SaveUser.create(params(first_name: "Kwame")) do |operation, _|
      operation.saved?.should be_false
      operation.last_name.should have_error("is required")
    end
  end

  it "requires valid first name format" do
    SaveUser.create(params(first_name: "K/L")) do |operation, _|
      operation.saved?.should be_false
      operation.first_name.should have_error("not a valid")
    end
  end

  it "requires valid last name format" do
    SaveUser.create(params(last_name: "K/L")) do |operation, _|
      operation.saved?.should be_false
      operation.last_name.should have_error("not a valid")
    end
  end
end
