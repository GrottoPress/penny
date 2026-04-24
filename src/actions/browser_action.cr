abstract class BrowserAction < Lucky::Action
  include Shield::BrowserAction

  include Shield::LoginHelpers
  include Shield::EmailConfirmationHelpers
  include Shield::PasswordResetHelpers

  include Shield::LoginPipes
  include Shield::EmailConfirmationPipes
  include Shield::PasswordResetPipes

  include Lucky::SecureHeaders::SetFrameGuard
  include Lucky::SecureHeaders::SetSniffGuard
  include Lucky::SecureHeaders::SetXSSGuard

  skip :pin_login_to_ip_address

  authorize_user &.level.admin?

  accepted_formats [:html, :json], default: :html

  def frame_guard_value : String
    "SAMEORIGIN"
  end
end
