require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_model/railtie"
require "sprockets/railtie"
require 'rails/mongoid'

Bundler.require(*Rails.groups)

module APIItunesMusic
  class Application < Rails::Application
    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '/*', headers: :any, methods: [:get, :options]
      end
    end
  end
end
