# control route methods
module ControlRoute
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
      puts "Нельзя удалить станцию #{print_station(station(station_i))}"
      puts "т.к. эта станция первая или конечная станция в маршруте #{print_route(route(route_i))}"
    end
  end

  def r(route_i = nil)
    return puts "Маршрут #{print_full_route(route(route_i))}" unless route_i.nil?
    if !@railway.routes.empty?
      puts 'Список маршрутов: '
      @railway.routes.each { |route| puts " #{print_full_route(route)}" }
      puts ''
    else
      puts 'Нет ни одного маршурута'
    end
  end
end
