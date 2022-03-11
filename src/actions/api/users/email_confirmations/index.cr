class Api::Users::EmailConfirmations::Index < ApiAction
  include Shield::Api::Users::EmailConfirmations::Index

  param page : Int32 = 1

  get "/users/:user_id/email-confirmations" do
    json ListResponse.new(
      email_confirmations: email_confirmations,
      user: user,
      pages: pages
    )
  end
end
