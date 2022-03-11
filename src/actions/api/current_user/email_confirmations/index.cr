class Api::CurrentUser::EmailConfirmations::Index < ApiAction
  include Shield::Api::CurrentUser::EmailConfirmations::Index

  param page : Int32 = 1

  get "/account/email-confirmations" do
    json ListResponse.new(
      email_confirmations: email_confirmations,
      pages: pages
    )
  end
end
