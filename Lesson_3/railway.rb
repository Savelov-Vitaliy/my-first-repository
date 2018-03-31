
class Station

  attr_accessor :name, :trains

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
    @trains.select { |train| train.type == type }
  end 

end


class Route 

  attr_accessor :stations

  def initialize(beg_station, end_station)    
    @stations = [beg_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)    
    @stations.delete(station) if (station != @stations.first) && (station != @stations.last) # "Нельзя удалить первую/конечную станцию"
  end

end

class Train  

  attr_accessor :number, :type, :wagons, :speed, :route

  def initialize(train_number, train_type, number_of_wagons)
    @number = train_number
    @type = train_type
    @wagons = number_of_wagons
    @speed = 0
  end  

  def speed_up
    @speed += 1
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

  def station
    @route.stations[@station_index]
  end

  def to_route(route)
    @route = route
    @station_index = 0
    station.take_train(self)    
  end

  def moove(i)
    station.send_train(self)
    @station_index += i    
    station.take_train(self) 
  end

  def moove_forward
    moove(1) if station != route.stations.last  # "Поезд на конечной станции"  
  end

  def moove_back
    moove(-1) if station != route.stations.first # "Поезд на первой станции"    
  end

  def next_station
    @route.stations[@station_index + 1] if station != route.stations.last   # "Поезд на конечной станции"
  end

  def prev_station    
    @route.stations[@station_index - 1] if station != route.stations.first # "Поезд на первой станции"
  end

end
