require_relative 'boot'

require "rails"

# Import gems in Gemfile
Bundler.require(*Rails.groups)

# important that this is imported after gems in Gemfile are imported
%w(
  mongoid
  action_controller
  action_mailer
  active_resource
  active_job
  active_model
  sprockets
  action_cable
  action_view
).each do |framework|
begin
  require "#{framework}/railtie"
    rescue LoadError
  end
end
# Pick the frameworks you want:
# require "active_record/railtie"



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rail4Mongoid
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
	    g.view_specs false
	    g.helper_specs false
	  end
  end
end
