class World
  attr_reader :cars
  def initialize(rows, columns, number_of_cars, rides, bonus, steps)
    @rides = []
    @cars = (0...number_of_cars).map { |i| Car.new }
  end

  def add_ride(ride)
    @rides << ride
  end

  def run
    @cars.each do |car|
      while ride_index = find_best_ride_index_for(car) do
        car.add_ride @rides[ride_index]
        @rides.delete_at(ride_index)
      end
    end
  end

  private

  def find_best_ride_index_for(car)
    rides_with_indexes = @rides.map.with_index.to_a
    rides_with_indexes = rides_with_indexes.select { |(ride, index)| car.can_ride? ride }
    return nil unless rides_with_indexes.length > 0

    bonus_rides_with_indexes = rides_with_indexes.select { |(ride, index)| car.can_ride_with_bonus? ride }
    if bonus_rides_with_indexes.length > 0
      rides_with_indexes = bonus_rides_with_indexes
    end

    min, index = rides_with_indexes
      .map { |(ride, index)| [car.will_finish_ride_at(ride), index] }
      .min { |(value, index)| value }
    index
  end
end
