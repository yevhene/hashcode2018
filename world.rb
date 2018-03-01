class World
  attr_reader :cars
  def initialize(rows, columns, number_of_cars, rides, bonus, steps)
    @rides = []
    @cars = (0..number_of_cars).map { |i| Car.new }
  end

  def add_ride(ride)
    @rides << ride
  end

  def run
    rides_sorted_by_earliest_start.each do |ride|
      car = find_car_for ride
      car.add_ride ride
    end
  end

  private

  def rides_sorted_by_earliest_start
    @rides.sort_by { |ride| ride.earliest_start}
  end

  def find_car_for(ride)
    @cars.detect { |car| car.can_ride? ride }
  end
end
