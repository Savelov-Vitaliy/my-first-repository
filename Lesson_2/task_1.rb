
#вывести все месяцы в которых 30 дней

hash = {
  "январь" => 31, 
  "февраль" => 28, 
  "март" => 31, 
  "апрель" => 30, 
  "май" => 31, 
  "июнь" => 30, 
  "июль" => 31, 
  "август" => 31, 
  "сентябрь" => 30, 
  "октябрь" => 31, 
  "ноябрь" =>30, 
  "декабрь" => 31
}

for i in hash.keys
  next if hash[i] != 30
  puts i
end
