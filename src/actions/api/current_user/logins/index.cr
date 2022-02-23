class Api::CurrentUser::Logins::Index < ApiAction
  include Shield::Api::CurrentUser::Logins::Index

  param page : Int32 = 1

  get "/account/logins" do
    json({
      status: "success",
      data: {logins: LoginSerializer.for_collection(logins)},
      pages: {
        current: page,
        total: pages.total
      }
    })
  end
end
