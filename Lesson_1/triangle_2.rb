#Прямоугольный треугольник

print "Введите три стороны треугольника через пробел: "
t = gets.chomp.split(' ').map{ |f| f.to_f } # t - triangle

h = t.max # h - hypotenuse 
t.delete(h)

a, b = t

unless t.empty? 
  print "Треугольник #{ h**2 == a**2 + b**2  ? 'прямоугольный' : 'не прямоугольный'} "
  puts "#{ a == b ? ', но равнобедренный' : ' ' }" 
else  
  puts "Треугольник не прямоугольный, а равносторнонний" 
end
