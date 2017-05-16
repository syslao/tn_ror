print 'Please enter a: '
a = gets.chomp.to_f

print 'Please enter b: '
b = gets.chomp.to_f

print 'Please enter c: '
c = gets.chomp.to_f

discriminant = b**2 - 4 * a * c
discriminant_sqrt = Math.sqrt(discriminant) if discriminant >= 0

if discriminant > 0
  first_sqrt = (-b + discriminant_sqrt) / (2 * a)
  second_sqrt = (-b - discriminant_sqrt) / (2 * a)
  puts "Discriminant is #{discriminant}, first square root is #{first_sqrt}," \
"second square root is #{second_sqrt}"
elsif discriminant.zero?
  sqrt = -b / (2 * a)
  puts "Discriminant is #{discriminant}, first square roots is #{sqrt}"
else
  puts 'No square roots'
end
