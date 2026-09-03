require "../../spec_helper"

describe PasswordResetQueryFilter do
  it "searches by user's name" do
    user = UserFactory.create &.first_name("Kofi")
    PasswordResetFactory.create &.user_id(user.id)

    params = fake_form(search: "kofi")

    PasswordResetQueryFilter.new
      .run(params)
      .first?
      .try(&.user_id)
      .should(eq user.id)

    params = fake_form(search: "ama")

    PasswordResetQueryFilter.new.run(params).first?.should(be_nil)
  end
end
