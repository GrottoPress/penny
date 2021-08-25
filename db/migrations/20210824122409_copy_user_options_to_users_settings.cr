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
# class CopyUserOptionsToUsersSettings::V20210824122409 < Avram::Migrator::Migration::V1
#   def migrate
#     AppDatabase.transaction do
#       UserOptionsQuery.new.preload_user.each do |options|
#         UpdateUser.update!(
#           options.user,
#           current_login: nil,
#           bearer_login_notify: options.bearer_login_notify,
#           login_notify: options.login_notify,
#           password_notify: options.password_notify,
#           # IMPORTANT!: Include any custom columns you've added...
#         )
#       end
#     end
#   end

#   def rollback
#     AppDatabase.transaction do
#       UserQuery.new.each do |user|
#         SaveUserOptions.upsert!(
#           user_id: user.id,
#           bearer_login_notify: user.settings.bearer_login_notify,
#           login_notify: user.settings.login_notify,
#           password_notify: user.settings.password_notify,
#           # IMPORTANT!: Include any custom properties you've added...
#         )
#       end
#     end
#   end
# end
