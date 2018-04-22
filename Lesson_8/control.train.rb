# control train methods
module ControlTrain
  def t
    if !@railway.trains.empty?
      puts 'Список всех поездов: '
      @railway.trains.each { |train| puts print_train(train) }
      puts ''
    else
      puts 'Нет одного поезда'
    end
  end

  def ta(train_number, train_type)
    @railway.add_train(train_number, train_type)
    puts "Создан поезд #{print_train_full(@railway.trains.last)}"
  end

  def te
    if !@railway.trains.empty?
      puts 'Список всех поездов (расширенный): '
      @railway.trains.each { |train| puts print_train_full(train) }
      puts ''
    else
      puts 'Нет одного поезда'
    end
  end

  def ts(train_i)
    return puts 'Поезд в депо. Станция не назначена. Назначте маршрут поезду' if train(train_i).station.nil?
    puts "Поезд #{print_train(train(train_i))} находится на станции #{print_station(train(train_i).station)}"
  end

  def tra(train_i, route_i)
    train(train_i).to_route(route(route_i))
    puts "Поезду #{print_train(train(train_i))} назначен маршрут #{print_route(route(route_i))}"
  end

  def twa(train_i, total_volume_or_seats)
    message = " Поезд #{print_train(train(train_i))} мчится со скоростью: #{train(train_i).speed}."
    return puts "Не могу прицепить вагон. #{message} Остановите поезд!" if train(train_i).speed > 0
    train(train_i).hitch_wagon(total_volume_or_seats.to_i)
    puts "К поезду #{print_train(train(train_i))} прицеплен новый вагон. Итого вагонов: #{train(train_i).wagons.size}"
  end

  def twd(train_i)
    message = "Поезд #{print_train(train(train_i))} мчится со скоростью: #{train(train_i).speed}."
    return puts "Не могу отцепить вагон. #{message} Остановите поезд!" if train(train_i).speed > 0
    message = "У поезда #{print_train(train(train_i))} нет вагонов"
    return puts "Не могу отцепить вагон. #{message}" if train(train_i).wagons.empty?
    train(train_i).detach_wagon
    puts "От поезда #{print_train(train(train_i))} отцеплен один вагон. Осталось вагонов: #{train(train_i).wagons.size}"
  end

  def tw(train_i)
    puts "У поезда #{print_train(train(train_i))}  #{@railway.trains[train_i.to_i].wagons.size}шт. вагонов"
    wagon_number = 0
    train(train_i).each_wagon do |wagon|
      puts "Вагон № #{wagon_number}, тип: #{wagon_type(wagon)}, свободно: #{wagon.free}, занято: #{wagon.occupied}"
      wagon_number += 1
    end
  end

  def twt(train_i, wagon_i, volume)
    wagon = train(train_i).wagons[wagon_i]
    print "У поезда #{print_train(train(train_i))} в вагоне № #{wagon_i} свободно:  #{wagon.free}, "
    wagon.take(volume)
    puts "занимаем: #{volume}, осталось: #{wagon.free}"
  end

  def tspu(train_i)
    train(train_i).speed_up
    puts "Набираем обороты. Cкорость поезда #{print_train(train(train_i))} : #{train(train_i).speed}"
  end

  def tstop(train_i)
    train(train_i).stop
    puts "Тормози! Поезд #{print_train(train(train_i))} остановлен"
  end

  def tf(train_i)
    if train(train_i).last_station?
      puts "Конечная, приехали! Поезд #{print_train(train(train_i))} дальше не идет"
    else
      train(train_i).moove_forward
      puts "Поезд #{print_train(train(train_i))} прибыл на станцию #{print_station(train(train_i).station)}"
    end
  end

  def tb(train_i)
    if train(train_i).first_station?
      puts 'Поезд на первой станции марштрута. Назад пути нет'
    else
      train(train_i).moove_back
      puts "Поезд #{print_train(train(train_i))} прибыл на станцию #{print_station(train(train_i).station)}"
    end
  end
end
