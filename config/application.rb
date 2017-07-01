require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DermaAsia
  class Application < Rails::Application
    if Rails.env.production?
      Raven.configure do |config|
        config.dsn = "#{ENV.fetch("SENTRY_DSN")}"
      end
    else
      Dotenv.overload(".env.local")
    end

    config.load_defaults 5.1
    config.active_job.queue_adapter = :delayed_job
    config.time_zone = "Kuala Lumpur"
    config.assets.quiet = true
    config.generators do |generate|
      generate.helper false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
      generate.job_specs false
    end
    config.i18n.default_locale = :ms
  end
end
