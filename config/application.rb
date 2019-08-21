require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BlogMe
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Rails.application.configure do
      config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
      config.i18n.available_locales = [:en, :vi]
      config.i18n.default_locale = :vi

    end
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins Rails.application.secrets.allowed_origins
        resource '*',
          headers: :any,
          methods: [:get, :post, :delete, :put, :patch]
      end
    end
  end
end
