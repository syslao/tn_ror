alphabet = 'a'..'z'
vowels = %w[a e i o u]
alphabet.each.with_index(1) { |val, index| puts "#{val} - #{index}" if vowels.include?(val) }
