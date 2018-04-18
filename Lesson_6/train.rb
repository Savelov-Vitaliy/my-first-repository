class Train  
  include InstanceCounter
  include Company
    
  @@all_trains = {}

  def self.find(number)
    @@all_trains[number]
  end

  attr_reader :number, :speed, :route, :wagons

  TRAIN_NUMBER_FORMAT = /\w{3}-{1}*\w{2}/i

  def initialize(train_number)
    @number = train_number
    @wagons = []
    @speed = 0
    @@all_trains[train_number] =  self
    register_instance
    validate!
  end 

  def do_it_with_every_wagon_of_this_train (&block)
    @wagons.each { |wagon| yield(wagon) } if block_given?
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

  def valid?
    validate!
  rescue
    false
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

  def validate!
    raise ArgumentError, "Номера поезда не указан" if number.delete(' ').empty?
    raise ArgumentError, "Неверный формат номера поезда" if number !~ TRAIN_NUMBER_FORMAT  
    true
  end

end
