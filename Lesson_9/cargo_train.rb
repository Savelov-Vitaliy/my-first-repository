class CargoTrain < Train

  initialize_validations
  
  def hitch_wagon(total_volume)
    super(CargoWagon.new(total_volume))
  end
end
