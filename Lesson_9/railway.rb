class RailWay
  attr_accessor :stations, :trains, :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def add_station(name)
    @stations << Station.new(name)
  end

  def add_train(train_number, train_type)
    @trains << (train_type == 'passenger' ? PassengerTrain.new(train_number) : CargoTrain.new(train_number))
  end

  def add_route(beg_station, end_station)
    @routes << Route.new(beg_station, end_station)
  end

  def del_route(route_i)
    @routes.delete_at(route_i)
  end
end
