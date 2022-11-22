class Api::CurrentUser::EmailConfirmations::Index < PublicApi
  include Shield::Api::CurrentUser::EmailConfirmations::Index

  param page : Int32 = 1

  get "/account/email-confirmations" do
    json EmailConfirmationSerializer.new(
      email_confirmations: email_confirmations,
      pages: pages
    )
  end
end
