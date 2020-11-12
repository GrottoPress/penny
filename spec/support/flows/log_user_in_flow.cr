class LogUserInFlow < BaseFlow
  def start_login
    visit CurrentLogin::New
  end

  def submit_login_details
    fill_form LogUserIn,
      email: "user@example.tld",
      password: "passwo)rdA1passw8d*hgh"

    click ".login-button"
  end

  def login_should_be_successful
    el("h1", text: "User Account").should be_on_page
  end
end
