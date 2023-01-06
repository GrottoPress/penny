# This action accepts **only** `Login` tokens for authentication purposes.
#
# It is useful if building an API backend for a decoupled frontend, where
# the frontend sends the user's email and password to the `CurrentLogin::Create`
# endpoint, in exchange for a `Login` token.
#
# The token is typically saved in a session store (eg: cookies) on the frontend,
# and sent along in the `Authorization` header whenever a request is made to
# this backend API on the logged-in user's behalf.
abstract class PrivateApi < Lucky::Action
  include Shield::ApiAction

  include Shield::Api::LoginHelpers
  include Shield::Api::EmailConfirmationHelpers
  include Shield::Api::PasswordResetHelpers

  include Shield::Api::LoginPipes
  include Shield::Api::EmailConfirmationPipes
  include Shield::Api::PasswordResetPipes

  skip :pin_login_to_ip_address

  accepted_formats [:json]

  route_prefix "/api"

  disable_cookies

  def authorize?(user : User)  : Bool
    user.level.admin?
  end
end
