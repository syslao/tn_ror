product = {}

while(true)
  print 'Please enter item name or stop to exit: '
  name = gets.chomp;
  case name
  when "stop"
    break
  else
    print 'Please enter unit price: '
    price = gets.chomp.to_i

    print 'Please enter quantity: '
    quantity = gets.chomp.to_f
    product[name] = {price => quantity}
  end
end

p product
product.each do | p, q|

end

