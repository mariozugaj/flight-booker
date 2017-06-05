require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FlightBooker
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :slim
    end
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
