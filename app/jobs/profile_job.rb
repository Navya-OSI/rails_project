class ProfileJob < ApplicationJob
  queue_as :default

  def perform(created_at, updated_at)
     puts "#{created_at}"
     puts "#{updated_at}"
     puts "job was successfully incorporated"
  end
end
