require "rubygems"
require "amqp"



AMQP.start({
    host: "184.73.224.102", 
    username: 'imagepu_hack', 
    password: 'userhack1295', 
    vhost: 'imagepu_queue'}) do
  q = MQ.new.queue("worker_test")
  q.subscribe do |message|
    puts message
  end
end
