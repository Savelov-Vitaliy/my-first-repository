#Площадь треугольника

print "Введите основание треугольника: "
a = gets.chomp.to_f

print "Введите высоту треугольника: "
h = gets.chomp.to_f

puts "Площадь треугольника с основанием #{a} и высотой #{h} = #{ (a * h) / 2 }"
