abstract class ApiAction < Lucky::Action
  include Shield::ApiAction

  skip :pin_login_to_ip_address

  accepted_formats [:html, :json], default: :json

  route_prefix "/api/v0"

  def authorize?(user : User)  : Bool
    user.level.admin?
  end
end
