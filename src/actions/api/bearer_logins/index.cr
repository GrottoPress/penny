class Api::BearerLogins::Index < ApiAction
  include Shield::Api::BearerLogins::Index

  param page : Int32 = 1

  get "/bearer-logins" do
    json BearerLoginSerializer.new(bearer_logins: bearer_logins, pages: pages)
  end
end
