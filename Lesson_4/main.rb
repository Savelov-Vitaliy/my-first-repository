require_relative "route.rb"
require_relative "station.rb"
require_relative "train.rb"
require_relative "passenger_train.rb"
require_relative "cargo_train.rb"
require_relative "passenger_wagon.rb"
require_relative "cargo_wagon.rb"
require_relative "railway.rb"
require_relative "control.rb"


$railway = RailWay.new
puts "Симулятор железной дороги"
puts "© Savelov_Vitaliy 2018"
help
start


=begin
loop do
  puts ""
  print "Командуйте: "
  i = gets
  if i != nil  
    i = i.chop.split("(")
    break if i[0] == "0"  
    i[1] != nil ? i[1].split(",")[1] != nil ? send(i[0], i[1].split(",")[0], i[1].split(",")[1].split(")")[0]) : send(i[0], i[1].split(")")[0]) : send(i[0]); #send(i,"gets")  'text(22)'[/\(^\((.*)\)/]
  end
end
=end




