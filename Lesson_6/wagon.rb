class Wagon
  include Company

  attr_accessor :total, :free

  def initialize(volume)
    @total = @free = volume
  end

   def take(volume)
    @free -= volume if @free >= volume
  end

  def occupied
    @total - @free
  end

end