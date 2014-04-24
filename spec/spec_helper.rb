ENV['RACK_ENV'] = 'test'

require_relative '../boot'

require 'lib/tasks/db'
require 'database_cleaner'
require 'capybara/rspec'

Capybara.app = Application

RSpec.configure do |config|
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
