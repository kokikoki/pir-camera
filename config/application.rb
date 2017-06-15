require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module PirCamera
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    # config.api_only = true
    config.api_only = false

    config.action_controller.permit_all_parameters = true

    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'

    # config.middleware.use Rack::Session::Cookie
    # config.middleware.use ActionDispatch::Session::CookieStore
    # config.middleware.insert_after(ActiveRecord::QueryCache, ActionDispatch::Cookies)
    # config.middleware.insert_after(ActionDispatch::Cookies, ActionDispatch::Session::CookieStore)

  end
end