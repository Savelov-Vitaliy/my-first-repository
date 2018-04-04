class CargoTrain < Train

  def hitch_wagon
    super(PassengerWagon.new)
  end
  
end
