# queue_test
testing sidekiq vs celery


# Ruby / Sidekiq

you can load up the queue with the following commands:

from the command-line:

`irb -r ./sidekiq_ruby.rb`

then from the ruby interpreter:

```
1.upto(1000000) do |x|
  puts x if x % 10000 == 0 # status update only
  QueueTest.perform_async(x) # push current index value into queue
end
```
(or one line if you want to be fancy)
`1.upto(1000000) { |x| puts x if x % 10000 == 0; QueueTest.perform_async(x) }`


to start sidekiq:

`sidekiq -r ./sidekiq_ruby.rb`

which will run with a concurrency of 25 by default. to change concurrency use the -c option:

`sidekiq -c 50 -r ./sidekiq_ruby.rb`
