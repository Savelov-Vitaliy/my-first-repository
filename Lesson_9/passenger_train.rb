class PassengerTrain < Train

  initialize_validations

  def hitch_wagon(total_seats)
    super(PassengerWagon.new(total_seats))
  end
end
