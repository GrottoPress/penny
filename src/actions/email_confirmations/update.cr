class EmailConfirmations::Update < BrowserAction
  include Shield::EmailConfirmations::Update

  skip :pin_email_confirmation_to_ip_address

  get "/email-confirmations/update" do
    run_operation
  end
end
