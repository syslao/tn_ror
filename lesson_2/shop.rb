product = {}
total_price = 0

loop do
  print 'Please enter item name or stop to exit: '
  name = gets.chomp
  if name == 'stop'
    break
  else
    print 'Please enter unit price: '
    price = gets.chomp.to_i

    print 'Please enter quantity: '
    quantity = gets.chomp.to_f

# Подразумевается, что можно добавлять одинаковые позиции товаров 
#   и цена у них одинаковая

    if product.key?(name)
      product[name][product[name].keys[0]] = product[name].values[0] + quantity
    else
      product[name] = { price => quantity }
    end
  end
end

puts product

product.each do |k, v|
  product_price = v.keys[0] * v.values[0]
  total_price += product_price
  puts "#{k}: #{product_price}"
end

puts "total price is #{total_price}"
