class EmailConfirmations::Index < BrowserAction
  include Shield::EmailConfirmations::Index

  param page : Int32 = 1

  get "/email-confirmations" do
    html IndexPage, email_confirmations: email_confirmations, pages: pages
  end
end
