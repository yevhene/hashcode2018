class Car
  attr_reader :row, :column
  def initialize
    @row, @column = 0, 0
    @rides = []
  end

  def rides
    @rides
  end

  def add_ride(ride)
    @rides << ride
  end

  def can_ride?(ride)
    @rides.sum(&:distance) <= ride.earlist_start
  end
end
