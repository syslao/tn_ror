alphabet = 'a'..'z'
vowels = %w[a e i o u]
alphabet.each_with_index { |val, index| puts "#{val} - #{index + 1}" if vowels.include?(val) }
