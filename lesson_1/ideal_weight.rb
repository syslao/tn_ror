print "Please enter your name: "
name = gets.chomp.capitalize

print "Please enter your height: "
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight < 0
	puts "#{name}, your weight is already optimal"
else
	puts "#{name}, your ideal weight is #{ideal_weight}"
end