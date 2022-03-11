class Api::CurrentUser::Logins::Index < ApiAction
  include Shield::Api::CurrentUser::Logins::Index

  param page : Int32 = 1

  get "/account/logins" do
    json ListResponse.new(logins: logins, pages: pages)
  end
end
