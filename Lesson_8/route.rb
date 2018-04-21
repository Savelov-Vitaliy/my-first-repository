
class Route 
  include InstanceCounter

  @@instances = 0

  attr_accessor :stations

  def initialize(beg_station, end_station)    
    @stations = [beg_station, end_station]
    register_instance
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station) if !@stations.include?(station)
  end

  def del_station(station)    
    @stations.delete(station) if (station != @stations.first) && (station != @stations.last) 
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise ArgumentError, "Неверно указана начальная станция маршрута" if stations.first.class != Station
    raise ArgumentError, "Неверно указана конечная станция маршрута" if stations.last.class != Station
    true
  end

end
