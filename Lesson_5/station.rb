
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

end