class RailWay

  attr_accessor :stations, :trains, :routes

  TRAIN_NUMBER_FORMAT = /\w{3}-{1}*\w{2}/i

  def initialize
    @stations = [] 
    @trains = []
    @routes = []
  end

  def add_station(name)
    @stations << Station.new(name) if station_valid?(name)
  end

  def add_train(train_number, train_type) 
    ( train_type == 'passenger' ? @trains << PassengerTrain.new(train_number) : @trains << CargoTrain.new(train_number) )   if train_valid?(train_number, train_type)
  end

  def add_route(beg_station, end_station)
    @routes << Route.new(beg_station, end_station) if route_valid?(beg_station, end_station)
  end

  def del_route(route_i)
    @routes.delete_at(route_i)
  end

  private

  def station_valid?(name)
    raise ArgumentError, "Название станции не задано" if name.delete(' ').empty?
    true 
  end

  def train_valid?(train_number, train_type)
    raise ArgumentError, "Номера поезда не указан" if train_number.delete(' ').empty?
    raise ArgumentError, "Неверный формат номера поезда" if train_number !~ TRAIN_NUMBER_FORMAT
    raise ArgumentError, "Тип поезда не указан" if train_type.delete(' ').empty?
    raise ArgumentError, "Неверно указан тип поезда" if (train_type != 'passenger') && (train_type != 'cargo')    
    true
  end

  def route_valid?(beg_station, end_station)
    raise ArgumentError, "Неверно указана начальная станция маршрута" if beg_station.class != Station
    raise ArgumentError, "Неверно указана конечная станция маршрута" if end_station.class != Station
    true
  end

end
