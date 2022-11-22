class Api::Users::BearerLogins::Index < PublicApi
  include Shield::Api::Users::BearerLogins::Index

  param page : Int32 = 1

  get "/users/:user_id/bearer-logins" do
    json BearerLoginSerializer.new(
      bearer_logins: bearer_logins,
      user: user,
      pages: pages
    )
  end
end
