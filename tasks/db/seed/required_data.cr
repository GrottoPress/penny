# Add seeds here that are *required* for your app to work.
# For example, you might need at least one admin user or you might need at least
# one category for your blog posts for the app to work.
#
# Use `Db::Seed::SampleData` if your only want to add sample data helpful for
# development.
class Db::Seed::RequiredData < LuckyTask::Task
  summary "Add database records required for the app to work"

  def call
    add_root_user
    log_done
  end

  private def add_root_user
    RootUser.new.call
  end

  private def log_done
    output.puts "Done adding required data"
  end
end
