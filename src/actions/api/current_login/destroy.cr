class Api::CurrentLogin::Destroy < ApiAction
  include Shield::Api::CurrentLogin::Destroy

  delete "/login" do
    run_operation
  end
end
