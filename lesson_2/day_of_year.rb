
print 'Please enter day: '
day = gets.chomp.to_i

print 'Please enter month: '
month = gets.chomp.to_i

print 'Please enter year: '
year = gets.chomp.to_i

def leap?(year)
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) ? 29 : 28
end

days = [31, leap?(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
index = 0

(0..month - 2).each do |m|
  index += days[m]
end

puts index + day
