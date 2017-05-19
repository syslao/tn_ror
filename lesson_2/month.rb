require 'active_support/time'

hash = {}
(1..12).each do |month|
  hash[month] = Time.new(2014, month).end_of_month.day
end

puts hash

hash.each do |k, v|
  puts "#{k} :#{v}" if v == 30
end
