class Api::BearerLogins::Index < ApiAction
  include Shield::Api::BearerLogins::Index

  param page : Int32 = 1

  get "/bearer-logins" do
    json({
      status: "success",
      data: {
        bearer_logins: BearerLoginSerializer.for_collection(bearer_logins)
      },
      pages: {
        current: page,
        total: pages.total
      }
    })
  end
end
