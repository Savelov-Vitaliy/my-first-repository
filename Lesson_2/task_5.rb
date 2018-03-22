# порядковый номер даты с начала года

print "Введите дату в формате dd.mm.yyyy : "
day, month, year = gets.chomp.split('.').map{ |i| i.to_i }

days_in_february = 28

if year % 4 == 0              
  days_in_february = 29
  if year % 100 == 0         
    days_in_february = 28
    if year % 400 == 0        
      days_in_february = 29
    end  
  end
end

days_in_month = [31, days_in_february ,31, 30 ,31 , 30 , 31, 31, 30 ,31 ,30 , 31]

day_number = day

for i in 0..month-2
  day_number += days_in_month[i] 
end

puts "#{day}.#{month}.#{year} - это #{day_number}-й день года (#{days_in_february == 28 ? 'високосный год' : 'не високосный год'})"
