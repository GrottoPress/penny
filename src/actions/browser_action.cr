abstract class BrowserAction < Lucky::Action
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
