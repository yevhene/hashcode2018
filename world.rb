class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

class World
  attr_reader :cars
  def initialize(rows, columns, number_of_cars, rides, bonus, steps)
    @rides = []
    @cars = (0...number_of_cars).map { |i| Car.new bonus }
  end

  def add_ride(ride)
    @rides << ride
  end

  def run
    @cars.each_with_index do |car, car_index|
      cars_left = @cars.length - car_index - 1
      while ride_index = find_best_ride_index_for(car, cars_left) do
        car.add_ride @rides[ride_index]
        @rides.delete_at(ride_index)
      end
    end
  end

  private

  def find_best_ride_index_for(car, cars_left)
    rides =  @rides.map { |ride| car.get_points ride, @rides.length, cars_left }
    points, index = rides.each_with_index.max
    return index if !points.nil? && points.to_i >= 1
  end
end
