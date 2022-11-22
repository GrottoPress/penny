class Api::CurrentUser::BearerLogins::Index < PublicApi
  include Shield::Api::CurrentUser::BearerLogins::Index

  param page : Int32 = 1

  get "/account/bearer-logins" do
    json BearerLoginSerializer.new(bearer_logins: bearer_logins, pages: pages)
  end
end
