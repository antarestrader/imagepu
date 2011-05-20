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
    MQ.new.queue("worker_test").publish({name: "hello world", date: "today"}.to_json)
    AMQP.stop { EM.stop }
  end
rescue AMQP::Error => e
  puts e
end