
class Route
  include InstanceCounter
  include Validation

  attr_accessor :stations

  @instances = 0

  class << self
    attr_accessor :instances
  end

  def initialize(beg_station, end_station)
    @stations = [beg_station, end_station]
    register_instance    
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def del_station(station)
    @stations.delete(station) if (station != @stations.first) && (station != @stations.last)
  end

end
