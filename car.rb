class Car
  attr_reader :row, :column

  def initialize
    @row, @column = 0, 0
    @t = 0
    @rides = []
  end

  def rides
    @rides
  end

  def add_ride(ride)
    @t += ride.earliest_start + ride.distance
    @row = ride.finish_row
    @column = ride.finish_column
    @rides << ride
  end

  def can_ride?(ride)
    @t + ride.distance_from(row, column) < ride.latest_finish
  end

  def will_finish_ride_at(ride)
    return Integer::MAX unless can_ride? ride
    @t + ride.distance_from(@row, @column)
  end

  def result
    [@rides.count, *@rides.map(&:index)]
  end
end
