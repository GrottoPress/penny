abstract class BrowserAction < Lucky::Action
  include Shield::BrowserAction

  include Shield::LoginHelpers
  include Shield::AuthorizationHelpers
  include Shield::PasswordResetHelpers
  include Shield::EmailConfirmationHelpers

  include Shield::LoginPipes
  include Shield::AuthorizationPipes
  include Shield::PasswordResetPipes
  include Shield::EmailConfirmationPipes

  include Lucky::SecureHeaders::SetFrameGuard
  include Lucky::SecureHeaders::SetSniffGuard
  include Lucky::SecureHeaders::SetXSSGuard

  skip :pin_login_to_ip_address

  accepted_formats [:html, :json], default: :html

  def frame_guard_value : String
    "SAMEORIGIN"
  end

  def authorize?(user : User) : Bool
    user.level.admin?
  end
end
