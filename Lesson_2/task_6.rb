# сумма покупок

purchases = {}
puts "Для окончания ввода введите вместо назвния слово 'стоп'"

loop  do
  print "Название : " 
  name = gets.chomp
  break if name == "стоп" 

  print "Цена: " 
  price = gets.chomp.to_f

  print "Кол-во: " 
  quantity = gets.chomp.to_f

  purchases[name] = { price: price, quantity: quantity }
end

puts purchases.inspect

total = 0

purchases.each do |name, price_quantity| 
  sum = price_quantity[:price] * price_quantity[:quantity]
  puts "#{name} : #{sum} руб."
  total += sum
end

puts "итого: #{total}"
