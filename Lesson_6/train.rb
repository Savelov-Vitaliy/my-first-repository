class Train  
  include InstanceCounter
  include Company
    
  @@all_trains = {}

  def self.find(number)
    @@all_trains[number]
  end

  attr_reader :number, :speed, :route, :wagons

  def initialize(train_number)
    @number = train_number
    @wagons = []
    @speed = 0
    @@all_trains[train_number] =  self
    register_instance
  end 

  def speed_up
    @speed += 1   
  end

  def stop
    @speed = 0
  end  

  def detach_wagon
    @wagons.delete_at(-1) if @speed == 0 && @wagons.size > 0
  end

  def to_route(route)
    @route = route
    @station_index = 0
    station.take_train(self)     
  end
  
  def moove_forward
    moove(1) unless  last_station?
  end

  def moove_back
    moove(-1) unless first_station? 
  end

  def next_station
    @route.stations[@station_index + 1] unless  last_station?   
  end

  def prev_station    
    @route.stations[@station_index - 1] unless first_station? 
  end

  def station    
    @route.stations[@station_index] unless @route == nil
  end

  def first_station?
    station == @route.stations.first
  end

  def last_station?
    station == @route.stations.last
  end

  protected  

  def hitch_wagon(wagon)
     @wagons <<  wagon if @speed == 0 
  end

  def moove(i)
    station.send_train(self)
    @station_index += i    
    station.take_train(self) 
  end  

end
