class CurrentLogin::Destroy < BrowserAction
  include Shield::CurrentLogin::Destroy

  delete "/login" do
    run_operation
  end
end
