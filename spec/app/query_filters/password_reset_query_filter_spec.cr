require "../../spec_helper"

describe PasswordResetQueryFilter do
  it "searches by user's name" do
    user = UserFactory.create &.first_name("Kofi")
    PasswordResetFactory.create &.user_id(user.id)

    request = HTTP::Request.new("GET", "/?search=kofi")
    params = Lucky::Params.new(request)

    PasswordResetQueryFilter.new
      .run(params)
      .first?
      .try(&.user_id)
      .should(eq user.id)

    request = HTTP::Request.new("GET", "/?search=ama")
    params = Lucky::Params.new(request)

    PasswordResetQueryFilter.new.run(params).first?.should(be_nil)
  end
end
