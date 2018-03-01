class Car
  attr_reader :x, :y
  def initialize(x, y)
    @x, @y = x, y
  end

  def rides
    []
  end
end
