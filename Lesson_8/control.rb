# control RailWay class
class Control
  include ControlService
  include ControlStation
  include ControlRoute
  include ControlTrain

  attr_accessor :railway

  def initialize(railway)
    @railway = railway
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
    station_list = ''
    route.stations.each { |station| station_list += print_station(station) }
    "#{@railway.routes.index(route)}.(#{station_list})"
  end

  def train_type(train)
    train.class == PassengerTrain ? 'пассажирский' : 'грузовой'
  end

  def print_train(train)
    " #{@railway.trains.index(train)}.#{train.number} (#{train_type(train)}) "
  end

  def print_train_full(train)
    a = "#{@railway.trains.index(train)}.#{train.number} (#{train_type(train)})"
    b = ", станция: #{print_station(train.station)}" unless train.station.nil?
    c = ", марштрут: #{print_route(train.route)}" unless train.route.nil?
    d = ", скорость: #{train.speed}, вагонов: #{train.wagons.size}"
    "#{a} #{b} #{c} #{d}"
  end

  def wagon_type(wagon)
    wagon.class == PassengerWagon ? 'пассажирский' : 'грузовой'
  end
end
