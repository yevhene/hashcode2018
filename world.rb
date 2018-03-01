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
    rides_sorted_by_earliest_start.each do |ride|
      next unless ride.valid?
      car = find_car_for ride
      car.add_ride ride if car
    end
  end

  private

  def rides_sorted_by_earliest_start
    @rides.sort_by { |ride| ride.latest_finish - ride.distance }
  end

  def find_car_for(ride)
    available_cars = @cars.select { |car| car.can_ride? ride }
    find_nearest_car available_cars, ride
  end

  def find_nearest_car(cars, ride)
    cars.sort_by { |car| ride.distance_from car.row, car.column }.first
  end
end
