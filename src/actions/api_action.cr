abstract class ApiAction < Lucky::Action
  skip :pin_login_to_ip_address

  accepted_formats [:html, :json], default: :json

  route_prefix "/api/v0"

  disable_cookies

  def authorize?(user : User)  : Bool
    user.level.admin?
  end
end
