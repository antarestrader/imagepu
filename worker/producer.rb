require "rubygems"
require "amqp"

begin
  AMQP.start({
      host: "184.73.224.102", 
      username: 'imagepu_hack', 
      password: 'userhack1295', 
      vhost: 'imagepu_queue'}) do
    q = MQ.queue("worker_test").publish "hello world"
  end
rescue AMQP::Error => e
  puts e
end