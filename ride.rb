class Ride
  attr_reader :start_row, :start_column, :finish_row, :finish_column, :earlist_start, :latest_finish)

  def initialize(start_row, start_column, finish_row, finish_column, earlist_start, latest_finish)
    @start_row = start_row
    @start_column = start_column
    @finish_row = finish_row
    @finish_column = finish_column
    @earlist_start = earlist_start
    @latest_finish = latest_finish
  end

  def max_time
    latest_finish - earlist_start
  end

  def distance
    (start_row - finish_row).abs + (finish_row - finish_column).abs
  end
end
