require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Project
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.action_controller.raise_on_missing_callback_actions = false

    config.autoload_lib(ignore: %w(assets tasks))
    config.action_controller.default_protect_from_forgery = true
    config.active_storage.variant_processor = :mini_magick
    
  end
end
