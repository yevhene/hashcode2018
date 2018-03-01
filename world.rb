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
    min, index = @rides.map { |ride| car.will_finish_ride_at ride }.each_with_index.min
    return nil if min == Integer::MAX
    index
  end
end
