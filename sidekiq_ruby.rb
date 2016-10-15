require 'sidekiq'

Sidekiq.configure_client do |cfg|
  cfg.redis = { :namespace => 'x', :size => 1 }
end

Sidekiq.configure_server do |cfg|
  cfg.redis = { :namespace => 'x' }
end

class QueueTest
  include Sidekiq::Worker

#  @@logger = Logger.new("output.log")

  def perform(output)
    logger = Logger.new("output.log")
    logger.info "#{ Time.now.utc.to_i },#{ output },#{ rand(10000) / 100.00 }"
  end
end

#1.upto(100000) do |idx|
#  QueueTest.perform_async(idx)
#end
