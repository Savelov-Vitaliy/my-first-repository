# control station methods
module ControlStation
  def s
    if !@railway.stations.empty?
      puts 'Список станций: '
      @railway.stations.each { |station| puts print_station(station) }
      puts ''
    else
      puts 'Нет ниодной станции'
    end
  end

  def sa(name)
    @railway.add_station(name)
    puts "Создана станция #{@railway.stations.size - 1}.#{name}"
  end

  def st(station_i)
    passanger_trains = station(station_i).get_trains_by_type(PassengerTrain)
    cargo_trains =  station(station_i).get_trains_by_type(CargoTrain)
    puts "Поезда на станции #{print_station(station(station_i))}:"
    if !passanger_trains.empty?
      print 'пассажирские : '
      passanger_trains.each { |train| print print_train(train) + ',' }
      puts ''
    else
      puts ' нет пассажирских поездов,'
    end
    if !cargo_trains.empty?
      print 'грузовые : '
      cargo_trains.each { |train| print print_train(train) + ',' }
      puts ''
    else
      puts ' нет грузовых поездов'
    end
  end

  def stn(station_i)
    puts "На станции #{print_station(station(station_i))} находятся #{station(station_i).trains.size}шт. поездов"
    station(station_i).each_train do |train|
      puts "Поезд № #{train.number}, тип: #{train_type(train)}, вагонов: #{train.wagons.size}шт."
    end
  end
end
