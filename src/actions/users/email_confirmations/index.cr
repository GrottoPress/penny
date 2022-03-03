class Users::EmailConfirmations::Index < BrowserAction
  include Shield::Users::EmailConfirmations::Index

  param page : Int32 = 1

  get "/users/:user_id/email-confirmations" do
    html IndexPage, email_confirmations: email_confirmations, user: user, pages: pages
  end
end
