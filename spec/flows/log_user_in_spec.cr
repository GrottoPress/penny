require "../spec_helper"

describe LogUserInFlow do
  it "works" do
    flow = LogUserInFlow.new

    flow.start_login
    flow.submit_login_details
    flow.login_should_be_successful
  end
end
