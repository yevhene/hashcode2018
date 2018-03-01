class Ride
  attr_reader :index, :start_row, :start_column, :finish_row, :finish_column, :earliest_start, :latest_finish

  def initialize(index, start_row, start_column, finish_row, finish_column, earliest_start, latest_finish)
    @index = index
    @start_row = start_row
    @start_column = start_column
    @finish_row = finish_row
    @finish_column = finish_column
    @earliest_start = earliest_start
    @latest_finish = latest_finish
  end

  def max_time
    latest_finish - earliest_start
  end

  def distance
    (start_row - finish_row).abs + (start_column - finish_column).abs
  end

  def distance_to_start(row, column)
    (start_row - row).abs + (start_column - column).abs
  end

  def valid?
    max_time > distance
  end
end
