# This action accepts both `Login` and `BearerLogin` tokens for
# delegated authorization purposes.
#
# Use this to build an API to be consumed by the public, and by third-party
# applications.
#
# Because any token type is accepted, bearer tokens retrieved from the
# `Authorization` header MUST NOT be used as proof of authentication.
abstract class PublicApi < Lucky::Action
  include Shield::ApiAction

  include Shield::Api::BearerLoginHelpers
  include Shield::Api::EmailConfirmationHelpers
  include Shield::Api::PasswordResetHelpers

  include Shield::Api::BearerLoginPipes
  include Shield::Api::EmailConfirmationPipes
  include Shield::Api::PasswordResetPipes

  skip :pin_login_to_ip_address

  accepted_formats [:json]

  route_prefix "/api/v0"

  disable_cookies

  def authorize?(user : User)  : Bool
    user.level.admin?
  end
end
