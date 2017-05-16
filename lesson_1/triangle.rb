print 'Please enter base of triangle: '
base = gets.chomp.to_f

print 'Please enter triangle height: '
height = gets.chomp.to_f

triangle_area = 0.5 * base * height

puts "The area of the triangle is #{triangle_area}"
