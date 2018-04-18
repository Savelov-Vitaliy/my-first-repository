class PassengerTrain < Train
  
  def hitch_wagon(volume)
    super(PassengerWagon.new(volume))
  end
  
end