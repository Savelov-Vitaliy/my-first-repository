class Control

  attr_accessor :railway

  def initialize(railway)      
    @railway = railway   
  end

  def start
    loop do
      begin
        puts ""
        print "Командуйте: "
        input = gets.chop
        input = input.split(".")    
        if input[1] == nil 
          send(input[0]) 
        else 
          parametrs = input[1].split(",")
          if parametrs[1] == nil
            send(input[0], parametrs[0])
          else
            send(input[0], parametrs[0], parametrs[1])
          end
        end                     
      rescue      
        break if input[0] == "0"
        puts "Ошибка: неверная команда или обращение к несуществующему поезду, станции или маршруту"       
        puts "Попробуйте еще раз!"       
      end
    end
    puts "Выход. Спасибо за внимание и до новых встреч"  
  end

  def help  
    puts "Симулятор железной дороги"
    puts "© Savelov_Vitaliy 2018"
    puts ""
    puts "s : список всех станций"
    puts "st.индекс станции : список всех поездов на станций"
    puts "sa.название станции : создать новую станцию: "
    puts ""
    puts "r : список всех марштуров"
    puts "ra.индекс начальной станции, индекс конечной станции : создать марштрут"
    puts "rsa.индекс марштрута, индекс станции : добавить в марштрут станцию"
    puts "rsd.индекс марштрута, индекс станции : удалить станцию из марштрута"
    puts ""
    puts "t : список всех поездов"
    puts "tpa.номер поезда : создать пассажирский поезд"
    puts "tca.номер поезда : создать грузовой поезд"
    puts "tra.индекс поезда, индекс марштрута : поезду назаначить марштрут"
    puts "tf.индекс поезда : переместить поезд вперед по маршруту"
    puts "tb.индекс поезда : переместить поезд назад по маршруту"
    puts "ts.поезд : посмотреть на какой станции находится поезд"
    puts "tw.поезд : посмотреть сколько вагонов у поезда"
    puts "twa.индекс поезда : прицепить вагон к поезду"
    puts "twd.индекс поезда : отцепить вагон от поезда"
    puts "tspu.поезд : увеличить скорость поезда"
    puts "tstop.индекс поезда : остановить поезд"
    puts ""
    puts "0 : выход"
    puts "help : список комманд"
    puts "seed : 'посев', тестовая железная дорога + тест"
    puts ""
    puts "Расшифровка команд:"
    puts "r - route , s -station , t - train , a - add , d -delete"
    puts "p - passenger , c -cargo , w -wagon , f - forward , b - back , stp - stop , e - extended"
    puts ""    
    puts "Пример ввода команд: s (ввод), sa.Москва (ввод), ta.101 Скорый"    
    puts ""    
  end

  def s
    if @railway.stations.size > 0 
      puts "Список станций: "
      @railway.stations.each {|station| puts print_station(station)}
      puts ""
    else
      puts "Нет ниодной станции"
    end
  end

  def sa(name)
    @railway.add_station(name)
    puts "Создана станция #{@railway.stations.size-1}.#{name}"
  end

  def st(station_i)
    passanger_trains = station(station_i).get_trains_by_type(PassengerTrain)
    cargo_trains =  station(station_i).get_trains_by_type(CargoTrain)
    puts "Поезда на станции #{print_station(station(station_i))}:"
    if passanger_trains.size > 0 
      print "пассажирские : "
      passanger_trains.each { |train| print print_train(train)+"," }
      puts ""
    else
      puts " нет пассажирских поездов,"
    end
    if cargo_trains.size > 0 
      print "грузовые : "
      cargo_trains.each { |train| print print_train(train)+","  }
      puts ""
    else
      puts " нет грузовых поездов"
    end
  end

  def ra(beg_station_i, end_station_i)
    @railway.add_route(station(beg_station_i), station(end_station_i))
    puts "Создан маршрут #{print_route(@railway.routes.last)}"
  end

  def rd(route_i)
    @railway.del_route(route(route_i))
    puts "Удален маршрут #{route(route_i)}"
  end

  def rsa(route_i, station_i)
    if !route(route_i).stations.include?(station(station_i))
      route(route_i).add_station(station(station_i))
      puts "К маршруту #{print_route(route(route_i))} добавлена новая станция #{print_station(station(station_i))}"
    else
      puts "Ошибка. Cтанция #{print_station(station(station_i))} уже есть в маршруте #{print_route(route(route_i))}"
    end
  end

  def rsd(route_i, station_i)
    if (route(route_i).stations.first != station(station_i)) && (route(route_i).stations.last != station(station_i))
      route(route_i).del_station(station(station_i))
      puts "Cтанция #{print_station(station(station_i))} удалена из маршрута #{print_route(route(route_i))}"
    else
      puts "Нельзя удалить станцию #{print_station(station(station_i))} т.к. эта станция первая или конечная станция в маршруте #{print_route(route((route_i)))}"
    end
  end

  def r(route_i=nil)
    return puts "Маршрут #{print_full_route(route(route_i))}" if route_i !=nil
    if @railway.routes.size > 0 
      puts "Список маршрутов: " 
      @railway.routes.each { |route| puts " #{print_full_route(route)}" }
      puts ""
    else
      puts "Нет ни одного маршурута"
    end
  end

  def t
    if @railway.trains.size > 0 
      puts "Список всех поездов: "
      @railway.trains.each {|train| puts print_train(train)}
      puts ""
    else
      puts "Нет одного поезда"
    end
  end

  def te
    if @railway.trains.size > 0 
      puts "Список всех поездов (расширенный): "
      @railway.trains.each {|train| puts print_train_full(train)}
      puts ""
    else
      puts "Нет одного поезда"
    end
  end

  def ts(train_i)
    return puts "Поезд в депо. Станция не назначена. Назначте маршрут поезду" if train(train_i).station == nil 
    puts "Поезд #{print_train(train(train_i))} находится на станции #{print_station(train(train_i).station)}"
  end

  def tra(train_i, route_i)
    train(train_i).to_route(route(route_i))  
    puts "Поезду #{print_train(train(train_i))} назначен маршрут #{print_route(route(route_i))}"
  end


  def tpa(train_number)
    @railway.add_train(train_number, :passanger)
    puts "Создан поезд #{print_train_full(@railway.trains.last)}"
  end

  def tca(train_number)
    @railway.add_train(train_number, :cargo)
    puts "Создан поезд #{print_train_full(@railway.trains.last)}"
  end

  def twa(train_i)
      return puts "Не могу прицепить вагон. Поезд #{print_train(train(train_i))} мчится со скоростью: #{train(train_i).speed}. Остановите поезд!" if train(train_i).speed > 0
      train(train_i).hitch_wagon
      puts "К поезду #{print_train(train(train_i))} прицеплен новый вагон. Итого вагонов: #{train(train_i).wagons.size}" 
  end

  def twd(train_i)
    return puts "Не могу отцепить вагон. Поезд #{print_train(train(train_i))} мчится со скоростью: #{train(train_i).speed}. Остановите поезд!" if train(train_i).speed > 0
    return puts "Не могу отцепить вагон. У поезда #{print_train(train(train_i))} нет вагонов" if train(train_i).wagons.size == 0
    train(train_i).detach_wagon
    puts "От поезда #{print_train(train(train_i))} отцеплен один вагон. Осталось вагонов: #{train(train_i).wagons.size}" 
  end

  def tw(train_i)  
    puts "У поезда #{print_train(train(train_i))}  #{@railway.trains[train_i.to_i].wagons.size}шт. вагонов"
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
    unless train(train_i).last_station?
      train(train_i).moove_forward
      puts "Поезд #{print_train(train(train_i))} прибыл на станцию #{print_station(train(train_i).station)}"    
    else
      puts "Конечная, приехали! Поезд #{print_train(train(train_i))} дальше не идет"  
    end
  end

  def tb(train_i)
    unless train(train_i).first_station?
      train(train_i).moove_back
      puts "Поезд #{print_train(train(train_i))} прибыл на станцию #{print_station(train(train_i).station)}"
    else
      puts "Поезд на первой станции марштрута. Назад пути нет" 
    end    
  end  

  def seed    
    sa('Москва')
    sa('Магадан')
    sa('Екб')
    sa('Казань')
    sa('Новосиб')
    s
    ra(1, 4)
    ra(0, 3)
    ra(0, 2)
    rsa(1, 3)
    rsa(0, 0)  
    rsa(0, 2)
    rsa(0, 3)
    rsd(0, 4)
    r
    rsd(0, 3) 
    r(0)   
    tpa('101.Скорый')
    tpa('13.Lucky Star')
    tpa('x.Захудалый')
    tca('5-Тягач')
    tca('№777_Счастливчик')
    t
    tra(0, 1)
    tra(1, 0)  
    tra(2, 1)  
    tra(4, 2)
    twa(0)
    twa(0)
    twa(4)
    tspu(0)
    tspu(1)
    tspu(1)
    tspu(4)
    te
    tf(0)
    tf(4)
    tf(4)
    tf(1)
    tf(1)
    tf(1)
    tb(1)
    twd(2)
    twd(4)
    tstop(4)
    twd(4)
    te
  end

  private

  def station(station_i)
    @railway.stations[station_i.to_i]
  end

  def route(route_i)
    @railway.routes[route_i.to_i]
  end

  def train(train_i)
    @railway.trains[train_i.to_i]
  end

  def print_station(station)
    " #{@railway.stations.index(station)}.#{station.name} "
  end

  def print_route(route)
    "#{@railway.routes.index(route)}.(#{print_station(route.stations.first)}#{print_station(route.stations.last)})"
  end

  def print_full_route(route)
    station_list = ""
    route.stations.each {|station| station_list += print_station(station)}
    "#{@railway.routes.index(route)}.(#{station_list})"
  end

  def train_type(train)    
    train.class == PassengerTrain ? type = "пассажирский" : type = "грузовой"
  end

  def print_train(train)
    " #{@railway.trains.index(train)}.#{train.number} (#{train_type(train)}) "
  end

  def print_train_full(train)
    train.route == nil ? station = "" : station =", станция: #{print_station(train.station)}"
    train.route == nil ? route = "" : route =", марштрут: #{print_route(train.route)}"
    "#{@railway.trains.index(train)}.#{train.number} (#{train_type(train)}) #{station}#{route}, скорость: #{train.speed}, вагонов: #{train.wagons.size}"
  end

end