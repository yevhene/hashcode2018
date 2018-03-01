require_relative './ride.rb'
require_relative './world.rb'

head_line = gets
world = World.new(*head_line.split(' ').map(&:to_i))

while ride_line = gets do
  world.add_ride Ride.new(*ride_line.split(' ').map(&:to_i))
end

world.run
