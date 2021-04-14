class Api::Logins::Index < ApiAction
  include Shield::Api::Logins::Index

  param page : Int32 = 1

  get "/logins" do
    json({
      status: "success",
      data: {logins: LoginSerializer.for_collection(active_logins)},
      pages: {
        current: page,
        total: pages.total
      }
    })
  end

  private def active_logins
    logins.select &.active?
  end
end
