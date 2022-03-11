class Api::Users::BearerLogins::Index < ApiAction
  include Shield::Api::Users::BearerLogins::Index

  param page : Int32 = 1

  get "/users/:user_id/bearer-logins" do
    json ListResponse.new(
      bearer_logins: bearer_logins,
      user: user,
      pages: pages
    )
  end
end
