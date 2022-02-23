class Api::CurrentUser::BearerLogins::Index < ApiAction
  include Shield::Api::CurrentUser::BearerLogins::Index

  param page : Int32 = 1

  get "/account/bearer-logins" do
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
