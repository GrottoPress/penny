class LogUserInFlow < BaseFlow
  def start_login
    visit CurrentLogin::New
  end

  def submit_login_details
    fill_form StartCurrentLogin,
      email: "user@example.tld",
      password: "passwo)rdA1passw8d*hgh"

    click "@login-button"
  end

  def login_should_be_successful
    should have_element("h1", text: "User Account")
  end
end
