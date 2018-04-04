class PassengerTrain < Train

  def hitch_wagon
    super(CargoWagon.new)
  end
  
end