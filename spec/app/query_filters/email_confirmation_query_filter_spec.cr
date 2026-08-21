require "../../spec_helper"

describe EmailConfirmationQueryFilter do
  it "searches by user's name" do
    user = UserFactory.create &.first_name("Kofi")
    EmailConfirmationFactory.create &.user_id(user.id)

    request = HTTP::Request.new("GET", "/?search=kofi")
    params = Lucky::Params.new(request)

    EmailConfirmationQueryFilter.new
      .run(params)
      .first?
      .try(&.user_id)
      .should(eq user.id)

    request = HTTP::Request.new("GET", "/?search=ama")
    params = Lucky::Params.new(request)

    EmailConfirmationQueryFilter.new.run(params).first?.should(be_nil)
  end

  it "works when user_id is NULL" do
    email_confirmation = EmailConfirmationFactory.create &.ip_address("1.2.3.4")

    request = HTTP::Request.new("GET", "/?search=2.3")
    params = Lucky::Params.new(request)

    EmailConfirmationQueryFilter.new
      .run(params)
      .first?
      .try(&.id)
      .should(eq email_confirmation.id)
  end
end
