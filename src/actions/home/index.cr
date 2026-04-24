class Home::Index < BrowserAction
  skip :require_logged_out

  authorize_user { true }

  get "/" do
    # html Lucky::WelcomePage
    html IndexPage
  end
end
