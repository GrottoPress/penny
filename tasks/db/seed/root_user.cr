class Db::Seed::RootUser < LuckyTask::Task
  summary "Add first admin user"

  def call
    # You likely want to be able to run this file more than once. To do that,
    # only create the record if it doesn't exist yet:
    #
    # unless UserQuery.new.email("me@example.com").first?
    #  SaveUser.create!(email: "me@example.com", name: "Jane")
    # end

    return log_not_ran if UserQuery.new.level(:admin).any?
    add_user
  end

  private def add_user
    # Using a Avram::Factory:
    #
    # Use the defaults, but override just the email
    # UserFactory.create &.email("me@example.com")

    # Using a SaveOperation:
    #
    # SaveUser.create!(email: "me@example.com", name: "Jane")

    email = App.settings.root_user_email
    password = Random::Secure.urlsafe_base64(32)

    UserFactory.create &.email(email).level(:admin).password(password)
  end

  private def log_done
    output.puts "First admin user added"
  end

  private def log_not_ran
    output.puts "Admin user already exists"
  end
end
