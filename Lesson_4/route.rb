
class Route 

  attr_accessor :stations

  def initialize(beg_station, end_station)    
    @stations = [beg_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station) if !@stations.include?(station)
  end

  def del_station(station)    
    @stations.delete(station) if (station != @stations.first) && (station != @stations.last) # "Нельзя удалить первую/конечную станцию"
  end

end
