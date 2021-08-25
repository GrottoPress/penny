# # IMPORTANT!: Use this only if you intend to switch from `UserOptions`
# # to `UserSettings`.
# #
# # Temporarily remove:
# #
# #   `skip_file if Avram::Model.all_subclasses
# #     .map(&.stringify)
# #     .includes?("UserOptions")`
# #
# #   from `lib/shield/src/presets/user_settings.cr`, for this
# #   migration to compile.
# class AddSettingsToUsers::V20210815163059 < Avram::Migrator::Migration::V1
#   def migrate
#     alter :users do
#       add settings : JSON::Any, fill_existing_with: JSON.parse({
#         password_notify: true,
#         bearer_login_notify: true,
#         login_notify: true
#       }.to_json)
#     end
#   end

#   def rollback
#     alter :users do
#       remove :settings
#     end
#   end
# end
