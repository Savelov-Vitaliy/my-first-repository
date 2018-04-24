class CargoTrain < Train
  def hitch_wagon(total_volume)
    super(CargoWagon.new(total_volume))
  end
end
