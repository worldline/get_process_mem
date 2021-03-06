# Get Process Memory for Ruby 1.8.7

[![Build Status](https://travis-ci.org/worldline/get_process_mem.png?branch=master)](https://travis-ci.org/worldline/get_process_mem)

Do you need to get the memory usage of a process? Great because this library does that.

## Install

In your `Gemfile` add

```ruby
gem 'get_process_mem-1-8-7'
```

then run `$ bundle install`


## Use It

Get the current process memory usage:

```ruby
puts mem = GetProcessMem.new.inspect
#<GetProcessMem @mb=24.28125 @gb=0.023712158203125 @kb=24864.0 @bytes=25460736 >
mem.bytes # => 25460736
mem.kb    # => 24864.0
mem.mb    # => 24.28125
mem.gb    # => 0.023712158203125
```

Note: All numeric values returned as a float except bytes which is an integer.

Get memory usage of another process:

```ruby
`echo 'nothing to see here' > tmplogf`
pid = Process.spawn('tail -f tmplog')
mem = GetProcessMem.new(pid)
puts mem.inspect
# => #<GetProcessMem @mb=0.48828125 @gb=0.000476837158203125 @kb=500.0 @bytes=512000 >

Process.kill('TERM', pid)
Process.wait(pid)

mem.inspect
# => "#<GetProcessMem @mb=0.0 @gb=0.0 @kb=0.0 @bytes=0>"
`rm tmplog`
```

On Linux, which provides `/proc/<pid>/smaps`, the default memory type returned is PSS, or "proportional set size", where shared memory is divided by the number of processes sharing it. On other platforms, the size returned is the RSS or the [Resident Set Size](http://en.wikipedia.org/wiki/Resident_set_size), basically how much memory the program takes up in RAM at the time, including all the shared memory.

The memory type can be specified by passing an options hash:

```ruby
GetProcessMem.new(Process.pid, mem_type: 'rss')
```



## License

MIT
