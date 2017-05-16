print 'Please enter first side of triangle: '
first_side = gets.chomp.to_f

print 'Please enter second side of triangle: '
second_side = gets.chomp.to_f

print 'Please enter third side of triangle: '
third_side = gets.chomp.to_f

sides = [first_side, second_side, third_side].sort
right_triangle = sides[2]**2 == (sides[0]**2 + sides[1]**2)
isosceles_triangle = sides.uniq.length == 2

if sides.uniq.length == 1
  puts 'Triangle is isosceles and equilateral'
elsif right_triangle
  puts "Triangle is rectangular #{'and isosceles' if isosceles_triangle}"
else
  puts 'Triangle is not rectangular'
end
