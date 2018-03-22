
#заполнить массив числами от 10 до 100 с шагом 5

array = []

for i in 10..100
  next if i % 5 != 0
  array << i
end

puts array
