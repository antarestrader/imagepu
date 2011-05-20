require "rubygems"
require "amqp"
require "json"

require "./dispatch"


REMOTE = {
      port: 1419,
      host: "184.73.224.102", 
      username: 'imagepu_hack', 
      password: 'userhack1295', 
      vhost: 'imagepu_queue'}
      
LOCAL = {host: "localhost"}

AMQP.start(LOCAL) do |con|
#  q = MQ.new.queue("worker_test")
 # q.subscribe do |message|
 
  channel = AMQP::Channel.new(con)
  channel.queue("worker_test").subscribe do |message|
    job = JSON.parse(message)
    puts "Dispatching"
    Dispatch.run job
  end
end


