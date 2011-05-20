require "rubygems"
require "amqp"
require "mq"

AMQP.start({host: ,) do
  q = MQ.new.queue("worker_test")
  q.subscribe do |message|
    puts message
  end
end
