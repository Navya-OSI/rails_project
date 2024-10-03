require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module PoductReview
  class Application < Rails::Application
    config.load_defaults 5.2
    # implementing a active job using the sidekiq library
    #in this we are telling to machine that we are using the sidekiq library
    config.active_job.queue_adapter = :sidekiq

  end
end
