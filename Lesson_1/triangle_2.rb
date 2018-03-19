#Прямоугольный треагольник

print "Введите три стороны треугольника через пробел: "
triangle = gets.chomp.split(' ')

triangle = triangle.map{ |f| f.to_f }

hypotenuse = triangle.max

triangle.delete(hypotenuse)


if !triangle.empty? 
	puts "Треугольник #{ hypotenuse**2 == triangle[0]**2 + triangle[1]**2  ? 'прямоугольный' : 'не прямоугольный'} "
	print ", равнобедренный" if triangle[0]==triangle[1]
else	
	puts "Треугольник не прямоугольный, равносторнонний" 
end
