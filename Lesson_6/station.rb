
class Station
  include InstanceCounter

  @@instances = 0
  @@all_stations = []

  def self.all
    @@all_stations
  end

  attr_accessor :name  

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
    validate!
  end  

  def take_train(train)
    @trains << train
  end 

  def send_train(train)
    @trains.delete(train)
  end 

  def get_trains_by_type(type)
    @trains.select { |train| train.class == type }
  end 

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise ArgumentError, "Название станции не задано" if name.delete(' ').empty?
    true 
  end

end
