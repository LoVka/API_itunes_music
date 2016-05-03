ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include Mongoid::Matchers, type: :model
  config.include Rack::Test::Methods

  def app
    Rails.application
  end

  config.before(:each) do
    Artist.delete_all
    Album.delete_all
  end
end
