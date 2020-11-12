class CurrentUser::New < BrowserAction
  include Shield::EmailConfirmationCurrentUser::New

  skip :pin_email_confirmation_to_ip_address

  get "/account/new" do
    run_operation
  end
end
