abstract class ApiAction < Lucky::Action
  include Shield::ApiAction

  include Shield::Api::LoginHelpers
  include Shield::Api::AuthorizationHelpers
  include Shield::Api::PasswordResetHelpers
  include Shield::Api::EmailConfirmationHelpers

  include Shield::Api::LoginPipes
  include Shield::Api::AuthorizationPipes
  include Shield::Api::PasswordResetPipes
  include Shield::Api::EmailConfirmationPipes

  skip :pin_login_to_ip_address

  accepted_formats [:html, :json], default: :json

  route_prefix "/api/v0"

  def authorize?(user : User)  : Bool
    user.level.admin?
  end
end
