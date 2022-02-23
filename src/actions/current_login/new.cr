class CurrentLogin::New < BrowserAction
  include Shield::CurrentLogin::New

  get "/login" do
    operation = StartCurrentLogin.new(remote_ip: remote_ip?, session: session)
    html NewPage, operation: operation
  end
end
