
class Station

  attr_accessor :name
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end 

  def send_train(train)
    @trains.delete(train)
  end 

  def get_trains_by_type(type)
    return @trains.select { |train| train.type == type }
  end 

end


class Route 

  attr_accessor :stations

  def initialize(beg_station, end_station)    
    @stations = [beg_station, end_station]
  end

  def add_station(station)
    last_station = @stations.last
    @stations[-1] = station
    @stations << last_station
  end

  def del_station(station)    
    @stations.delete(station) if (station != @stations.first) && (station != @stations.last) # "Нельзя удалить первую/конечную станцию"
  end

end

class Train  

  attr_accessor :number
  attr_accessor :type
  attr_accessor :wagons
  attr_accessor :speed
  attr_accessor :route
  attr_accessor :station

  def initialize(train_number, train_type, number_of_wagons)
    @number = train_number
    @type = train_type
    @wagons = number_of_wagons
    @speed = 0
  end  

  def speed_up(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def hitch_wagon
     @wagons += 1 if  @speed == 0 #  "Не погу прицепить вагон. Поезд в пути"
  end

  def detach_wagon
     @wagons -= 1 if  (@speed) == 0 && (@wagons > 0) #  "Не погу отцепить вагон. Поезд в пути или у поезда нет вагонов"
  end

  def to_route(route)
    @station = route.stations.first
    @route = route
  end

  def moove_forward
    @station = route.stations[route.stations.index(@station) + 1] if @station != route.stations.last   # "Поезд на конечной станции"
  end

  def moove_back
    @station = route.stations[route.stations.index(@station) - 1] if @station != route.stations.first # "Поезд на первой станции"
  end

  def next_station
    @route.stations[route.stations.index(@station) + 1] if @station != route.stations.last   # "Поезд на конечной станции"
  end

  def prev_station
    @route.stations[route.stations.index(@station) - 1] if @station != route.stations.first # "Поезд на первой станции"
  end

end
