#ideal weight

print "Привет, хочешь узнать свой идельаный вес? Как тебя зовут? "
name = gets.chomp.capitalize # странно, почему не капитализирует русский?

print "Каков твой рост? "
weight = gets.chomp.to_i

ideal_weight = weight - 100

if ideal_weight > 0
	puts "#{name}, Ваш идеальный вес #{ideal_weight}"
else
	puts "#{name}, Ваш вес уже оптимальный ;)"
end