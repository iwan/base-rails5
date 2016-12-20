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
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BaseRails5
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.time_zone = 'Rome'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en, :it]
    config.i18n.default_locale = :en


    config.action_mailer.smtp_settings = { 
      address: ENV["smtp_address"],
      user_name: ENV["smtp_username"],
      password: ENV["smtp_password"],
      authentication: ENV["smtp_authentication"],
      enable_starttls_auto: true,
      port: ENV["smtp_port"].to_i
      # :domain => "bananair.com",
    }
  end
end
