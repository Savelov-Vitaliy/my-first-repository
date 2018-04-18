class CargoTrain < Train
  
  def hitch_wagon(volume)
    super(CargoWagon.new(volume))
  end
  
end
