# line 2 is not a comment, it is a "shebang!" it tells the rogram loader what command to use to run the program
#!/usr/bin/env ruby

require 'Twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "zyoZqmjVK9tBcCNCqbogyOW4M"
  config.consumer_secret     = "	rDdtd0oebyNtfKTOH3kq7RzLyLrO8Ue5DdSQ8h4x129AYlEt2o"
  config.access_token        = "14650379-MJDMo50gRi2k6Zs62MfSOlW7O0LDqgjfIb2HbZRbi"
  config.access_token_secret = "Ax0q28oa4UGwnYeZ9hxaxhmDV5ufR8cvOdd0A7QXeNmHM"
  client.update('Tweet from the command line!')
end
