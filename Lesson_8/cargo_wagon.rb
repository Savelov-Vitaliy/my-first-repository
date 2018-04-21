class CargoWagon < Wagon 

  attr_accessor :total_volume, :free

  def initialize(total_volume)
    @total_volume = @free = total_volume
  end

   def take(volume)
    @free -= volume if @free >= volume
  end

  def occupied
    @total_volume - @free
  end


end
