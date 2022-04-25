# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.development?
  ActiveStorage::Current.url_options = { host: 'localhost: 3000' }
end
