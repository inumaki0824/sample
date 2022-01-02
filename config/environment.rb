Rails.application.configure do
    config.hosts.clear
end

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

  
