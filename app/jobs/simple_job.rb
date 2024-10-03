class SimpleJob < ApplicationJob
  queue_as :default
  # queue_as means defining priority so for example we have custom_queues if you define
  #  queue_as :mailers that means your job will goes to the mailers queue and we can define the queues in sidekiq.yml

  def perform(name)
    puts 'product was successfully created'
  end
end
