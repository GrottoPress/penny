# class Health::Show < PrivateApi
#   skip :require_logged_in
#   skip :require_logged_out

#   get "/up" do
#     verify_database_connection
#     verify_redis_connection

#     head :no_content
#   end

#   private def verify_database_connection
#     BaseModel.read_database.exec("SELECT 1;")
#   end

#   private def verify_redis_connection
#     Mel.settings.store.as(Mel::Redis).client.run({"PING"})
#   end
# end
