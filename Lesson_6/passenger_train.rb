class PassengerTrain < Train
  
  def hitch_wagon
    super(PassengerWagon.new)
  end
  
end