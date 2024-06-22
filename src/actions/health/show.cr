class Health::Show < BrowserAction
  skip :require_logged_in
  skip :require_logged_out

  get "/up" do
    head :no_content
  end
end
