#Решение квадратного уравнения

print "Введите коэффицианты a, b, c для уравнения ax^2 + bx + c =0 через пробел: "
a, b, c = gets.chomp.split(' ').map{ |f| f.to_f }

d = b**2 - 4 * a * c

if d >= 0
  x_1 = (-b + Math.sqrt(d)) / (2 * a)
  x_2 = (-b - Math.sqrt(d)) / (2 * a)
  print "Дискриминант = #{d}. x_1 = #{x_1}"
  puts "#{d > 0 ? (' , x_2 = ' + x_2.to_s) : ' '}" 
else
  puts "Дискриминант = #{d}. Корней нет"
end
