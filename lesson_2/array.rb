array = []
(10..100).each do |digit|
  next if digit % 5 != 0
  array << digit
end

puts array
