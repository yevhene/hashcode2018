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
    @t = will_start_at(ride) + ride.distance
    @row = ride.finish_row
    @column = ride.finish_column
    @rides << ride
  end

  def will_start_at(ride)
    will_be_at_start_point = @t + ride.distance_to_start(row, column)
    if will_be_at_start_point < ride.earliest_start
      ride.earliest_start
    else
      will_be_at_start_point
    end
  end

  def can_ride?(ride)
    @t + ride.distance_from(row, column) < ride.latest_finish
  end

  def will_finish_ride_at(ride)
    return Integer::MAX unless can_ride? ride
    @t + ride.distance_from(@row, @column)
  end

  def get_points(ride)
    return 0 unless can_ride? ride
    bonus = @t + ride.distance_to_start(row, column) == ride.earliest_start ? 2 : 0
    ride.distance + bonus
  end

  def result
    [@rides.count, *@rides.map(&:index)]
  end
end
