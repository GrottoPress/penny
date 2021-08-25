# # IMPORTANT!: Use this only if you intend to switch from `UserOptions`
# # to `UserSettings`.
# #
# # Run this migration only after you are sure your options were successfully
# # ported over in the previous migration.
# #
# # Temporarily remove:
# #
# #   `skip_file if Avram::Model.all_subclasses
# #     .map(&.stringify)
# #     .includes?("UserOptions")`
# #
# #   from `lib/shield/src/presets/user_settings.cr`, for this
# #   migration to compile.
# class RemoveUserOptions::V20210824122912 < Avram::Migrator::Migration::V1
#   def migrate
#     drop :user_options
#   end

#   def rollback
#     create :user_options do
#       primary_key id : Int64

#       add_timestamps
#       add_belongs_to user : User, on_delete: :cascade, unique: true

#       add bearer_login_notify : Bool
#       add login_notify : Bool
#       add password_notify : Bool
#     end
#   end
# end
