class CurrentLogin::Create < BrowserAction
  include Shield::CurrentLogin::Create

  post "/login" do
    run_operation
  end
end
