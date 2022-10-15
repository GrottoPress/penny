abstract class ApiAction < Lucky::Action
  # IMPORTANT!:
  #   This module reduces `Shield::Api::LoginPipes` from an authentication
  #   pipe to a delegated authorization pipe. Once included, bearer tokens
  #   retrieved from the `Authorization` header MUST NOT be used as proof
  #   of authentication.
  include Shield::Api::BearerLoginPipes

  skip :pin_login_to_ip_address

  accepted_formats [:json]

  route_prefix "/api/v0"

  disable_cookies

  def authorize?(user : User)  : Bool
    user.level.admin?
  end
end
