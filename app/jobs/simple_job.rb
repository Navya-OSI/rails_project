class SimpleJob < ApplicationJob
  queue_as :default

  def perform(name)
    puts 'product was successfully created'
  end
end
