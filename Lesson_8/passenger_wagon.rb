class PassengerWagon < Wagon

  attr_accessor :total_seats, :free

  def initialize(total_seats)
    @total_seats = @free = total_seats
  end

   def take(seats)
    @free -= 1 if @free >= 1
  end

  def occupied
    @total_seats - @free
  end

end
