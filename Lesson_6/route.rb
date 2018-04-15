
class Route 
  include InstanceCounter

  @@instances = 0

  attr_accessor :stations

  def initialize(beg_station, end_station)    
    @stations = [beg_station, end_station]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station) if !@stations.include?(station)
  end

  def del_station(station)    
    @stations.delete(station) if (station != @stations.first) && (station != @stations.last) 
  end

end
