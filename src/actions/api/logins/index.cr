class Api::Logins::Index < ApiAction
  include Shield::Api::Logins::Index

  param page : Int32 = 1

  get "/logins" do
    json ListResponse.new(logins: logins, pages: pages)
  end
end
