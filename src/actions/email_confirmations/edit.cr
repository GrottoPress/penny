class EmailConfirmations::Edit < BrowserAction
  include Shield::EmailConfirmations::Edit

  skip :pin_email_confirmation_to_ip_address

  get "/email-confirmations/edit" do
    run_operation
  end
end
