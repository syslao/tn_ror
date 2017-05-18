arr = []
(10..100).each do |digit|
  next if digit % 5 != 0
  arr << digit
end

puts arr
