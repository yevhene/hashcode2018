class Car
  attr_reader :row, :column

  def initialize(bonus)
    @row, @column = 0, 0
    @t = 0
    @rides = []
    @bonus = bonus
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

  def get_points(ride, rides_left, cars_left)
    distance_points =  can_ride?(ride) ? ride.distance : 0
    bonus_points = will_start_at(ride) == ride.earliest_start ? @bonus : 0
    wasteful_points = will_start_at(ride) - @t
    distance_points + bonus_points - rides_left / (cars_left + 1) / (wasteful_points + 1)
  end

  def result
    [@rides.count, *@rides.map(&:index)]
  end
end
