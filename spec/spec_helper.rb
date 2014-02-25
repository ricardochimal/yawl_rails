ENV['RAILS_ENV'] ||= 'test'
ENV['DATABASE_URL'] = 'postgres://localhost/yawl-rails-test'

require File.expand_path("../test_app/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.around(:each) do |example|
    Yawl::DB.transaction(:rollback => :always) do
      example.run
    end
  end
end
