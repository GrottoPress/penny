class Home::Index < BrowserAction
  skip :require_logged_out

  get "/" do
    # html Lucky::WelcomePage
    html IndexPage
  end

  def authorize?(user : User) : Bool
    user.id == current_user?.try &.id
  end
end
