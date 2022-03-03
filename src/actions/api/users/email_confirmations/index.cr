class Api::Users::EmailConfirmations::Index < ApiAction
  include Shield::Api::Users::EmailConfirmations::Index

  param page : Int32 = 1

  get "/users/:user_id/email-confirmations" do
    json({
      status: "success",
      data: {email_confirmations: EmailConfirmationSerializer.for_collection(
        email_confirmations
      )},
      pages: PaginationSerializer.new(pages)
    })
  end
end
