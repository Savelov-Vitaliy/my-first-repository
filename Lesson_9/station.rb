
class Station
  include InstanceCounter
  include Validation

  attr_accessor :name, :trains

  NAME_FORMAT = /[а-я\w]/i

  validate :name, :presence
  validate :name, :format, NAME_FORMAT
  validate :name, :type, String

  @instances = 0
  @all_stations = []

  class << self
    attr_accessor :instances, :all_stations

    def self.all
      @all_stations
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    self.class.all_stations ||= []
    self.class.all_stations << self
    register_instance    
    validate!
  end

  def each_train
    @trains.each { |train| yield(train) } if block_given?
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
