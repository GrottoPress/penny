require "../../spec_helper"

describe LoginQueryFilter do
  it "searches by user's name" do
    user = UserFactory.create &.first_name("Kofi")
    LoginFactory.create &.user_id(user.id)

    params = fake_form(search: "kofi")

    LoginQueryFilter.new
      .run(params)
      .first?
      .try(&.user_id)
      .should(eq user.id)

    params = fake_form(search: "ama")

    LoginQueryFilter.new.run(params).first?.should be_nil
  end
end
