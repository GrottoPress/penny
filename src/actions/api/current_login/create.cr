class Api::CurrentLogin::Create < ApiAction
  include Shield::Api::CurrentLogin::Create

  post "/login" do
    run_operation
  end
end
