require_relative './ride.rb'
require_relative './world.rb'

head_line = gets
world = World.new(*head_line.split(' ').map(&:to_i))

index = 0
while ride_line = gets do
  world.add_ride Ride.new(index, *ride_line.split(' ').map(&:to_i))
  index += 1
end

world.run
