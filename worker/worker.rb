require "rubygems"
require "amqp"
require "json"


REMOTE = {
      port: 1419,
      host: "184.73.224.102", 
      username: 'imagepu_hack', 
      password: 'userhack1295', 
      vhost: 'imagepu_queue'}
      
LOCAL = {host: "localhost"}

AMQP.start(LOCAL) do
  q = MQ.new.queue("worker_test")
  q.subscribe do |message|
    job = JSON.parse(message)
    puts "Dispatching"
    Dispatch.run job
  end
end


