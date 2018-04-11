class CargoTrain < Train

  def hitch_wagon
    super(CargoWagon.new)
  end
  
end
