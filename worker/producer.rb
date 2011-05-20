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

begin
  AMQP.start(LOCAL) do
    q = MQ.new.queue("worker_test")
    q.publish({
      source: "/tmp/_mg_6664.jpg", 
      destination: "/tmp/result_mg_6664.jpg",
      operation: "thumbnail",
      account: "john_doe"
    }.to_json)
    AMQP.stop { EM.stop }
  end
rescue AMQP::Error => e
  puts e
end